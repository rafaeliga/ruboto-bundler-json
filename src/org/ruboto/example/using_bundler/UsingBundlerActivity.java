package org.ruboto.example.using_bundler;

import android.os.Bundle;

public class UsingBundlerActivity extends org.ruboto.EntryPointActivity {
	public void onCreate(Bundle bundle) {
		setRubyClassName(getClass().getSimpleName());
	    super.onCreate(bundle);
	}
}
