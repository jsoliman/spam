package com.drin.java.clustering;

import com.drin.java.metrics.DataMetric;

import java.util.Collection;

public abstract class Clusterable<E> {
   protected String mName;
   protected Collection<E> mData;

   public Clusterable(String name, Collection<E> data) {
      mName = name;
      mData = data;
   }

   @Override
   public String toString() { return mName; }

   @Override
   public int hashCode() { return mName.hashCode(); }

   @Override
   public boolean equals(Object obj) {
      if (obj instanceof Clusterable) {
         return mName.equals(((Clusterable)obj).getName());
      }

      return false;
   }

   public int size() { return mData.size(); }
   public String getName() { return mName; }
   public Collection<E> getData() { return mData; }

   public abstract double compareTo(Clusterable<?> otherData);
   public abstract boolean isSimilar(Clusterable<?> otherData);
   public abstract boolean isDifferent(Clusterable<?> otherData);
}
