Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F5F3446C0
	for <regressions@lists.linux.dev>; Sun, 17 May 2026 12:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779022080; cv=none; b=gANAgDDPN4npZ7EO/b63KZikGUwYsCbdckA1QAwKzWN4fj/zJe0WHGvzFZZm2gh6bK36bvvpMGQJmmR5biFcxFbU9p47dvM++DoEjqxhcHMJcTMjMJJkmA/t4+bNlvWHUBsmbfi+dEl/deHKlOEorVBKqb/D7QKW3o6tCRpvqTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779022080; c=relaxed/simple;
	bh=w+kfh1Dy6u+UktO/Ojj08U2MzX1bLrF0iJTEvIbhID4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QdGcAbMmDvrhyj2y6J5dKh0lazoDE7KqUI+shL+rmpD2gYWLBF+zcT5yw0btpEkZFdGS2EMCYqIShJeiAAOSe4Is9NRU9zdyGTyrLD4JwlgKY81icLGL/uM4TzpEjVkS8Kd/10thpBiRj1oZli9ceeiyN9W7q8kBUhWEAlxzUcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fGwoi9Rm; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fGwoi9Rm"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a884815606so1779733e87.0
        for <regressions@lists.linux.dev>; Sun, 17 May 2026 05:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779022077; x=1779626877; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ICmnR9jgJrAJ4e5TLBFpaZ6Ac4G7v2Tf75marMuEa4I=;
        b=fGwoi9RmQQxxd96ybLfHaz6z4q2fAFE2XEul/wxhAYO9Gal8U/RzmAQCQXQZ02HqQl
         QpcZISFRHzZfXHHCQ+zaFJ2ZvK/deyInZo6iNwA5AxPyUo83w/9kGNR3e7bBn+3yMSlj
         bdHFKzeqFn4lNvc1q6DZQX/iLMEWIMQ4L6PjQN+ejTFNRumBoAPcFuV2fvZw1YCPBimE
         mbpBrkFACL24B4BRTF4YsfYK637Roxhze8UVpQOA5imb3W+GmZN87UqV4FlaI27HhPgt
         WhRNBKIzq93EYey03SvMuF/3AG7lBvEQxacUG1rLuBhs9hVQxwEG5XWBQTNndrMrzDNA
         vCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779022077; x=1779626877;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ICmnR9jgJrAJ4e5TLBFpaZ6Ac4G7v2Tf75marMuEa4I=;
        b=LjfMTpDqJcGF2eqY+whz2C7ES59wIeIYsrbYNDvXR5y1VsdKwDBvgWzCXoPgKgG3qF
         wTPQcm6g4fbhbZoKynxLAiQz9sfcyua7jehWh0anRXgtH5ma8x3Z805EexU9p0YD59+q
         agNZVRstKrvwV+jsMyLBPXIZEaGGoYKIFnfmLJqmHU//sTmpn/ThZ50fmciOOVsuwSxy
         tYqNIMPgT95LeXfYFPWxGnln7SuvNkv6zxuW19gUpxZONH1AeKW2JYB2ootc+2NXHdza
         LKWZYZmhij1mKft3xDWijz2b9n2ejN9aSiyqYNmxh8gR1Z/cltZQR9miePrU1vry008+
         H0zQ==
X-Forwarded-Encrypted: i=1; AFNElJ9aiHZbXC0CM6IcgdzonCWREwlXxfoIv2+Flqw1C3OC6X5EkEwTLjwfwQHwhO8RVX6sLFt3+2oVYHxV4w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyVwsw8x9F1vYDm5bIujorMV6F/HLAKmWEkMLvfirUkiBqSvra1
	nmcNs29t0et+JkZTomDQ+8ifOphxVUsvceoejCLZvrVeUGzQVU9JvXOn
X-Gm-Gg: Acq92OGhaTJ0AZkqFZhglECwgAFecmnqXPDoTVkW5XE28UTGyQhoti6mv1mqC9s4uc+
	ASAAjxqZBd6+U5R/jpj9Q4FYbpyF7E11a4OotKjfHj5PkRq/fZRnKXyM41ifwbcnFqOpdWYP2+p
	J3fhB5LvXgSf++41XBBfU/ixGOvQjl9T067YEhVWHGUv8z/8CK5/HBpEDdU8ycqPadsLz5PInWR
	TDZJgRFbWXpPwP2Hq5czYPupJApvOHNm+l9JkHEi9dK3g4erVt5yaD0cUwscizPvsVv9SuxMMKA
	GFYbV2PnrTJ+Tq05J7/LevGrdW4M3/BDN6OKgXVJBG1KREdo91ym1Zvea8ndqlz2HTnaCYQhtZC
	98vzHLpMOUfTrDM0oIrNgEOCD4PghpoE5dcANbvAabo7i22dK4gfRnW/OKUJRlkQqjW57R6u4ob
	T8PbqVquD5AslAT4FsLDE=
X-Received: by 2002:a05:6512:10c8:b0:5a8:d1ed:8d4a with SMTP id 2adb3069b0e04-5aa0e747254mr3434370e87.40.1779022077116;
        Sun, 17 May 2026 05:47:57 -0700 (PDT)
Received: from pc636 ([2001:9b1:d5a0:a500:de96:9acf:5dca:ede4])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a654sm2685723e87.30.2026.05.17.05.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 05:47:56 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Sun, 17 May 2026 14:47:55 +0200
To: Thorsten Leemhuis <regressions@leemhuis.info>,
	"Paul E . McKenney" <paulmck@kernel.org>
Cc: "Uladzislau Rezki (Sony)" <urezki@gmail.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Joel Fernandes <joelagnelf@nvidia.com>, RCU <rcu@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Samir <samir@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>, Tejun Heo <tj@kernel.org>,
	Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [PATCH -next v1 05/12] srcu: Don't queue workqueue handlers to
 never-online CPUs
Message-ID: <agm4-6f-6rOgQPFB@pc636>
References: <20260511175448.153326-1-urezki@gmail.com>
 <20260511175448.153326-6-urezki@gmail.com>
 <f669fbc9-c068-489f-bd91-4e81561a6e58@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f669fbc9-c068-489f-bd91-4e81561a6e58@leemhuis.info>

On Wed, May 13, 2026 at 12:38:01PM +0200, Thorsten Leemhuis wrote:
> On 5/11/26 19:54, Uladzislau Rezki (Sony) wrote:
> > From: "Paul E. McKenney" <paulmck@kernel.org>
> > 
> > While an srcu_struct structure is in the midst of switching from CPU-0
> > to all-CPUs state, it can attempt to invoke callbacks for CPUs that
> > have never been online.  Worse yet, it can attempt in invoke callbacks
> > for CPUs that never will be online, even including imaginary CPUs not in
> > cpu_possible_mask.  This can cause hangs on s390,
> 
> Uladzislau, Paul, according to the fixes tag below this change fixes a
> change that went into 7.0-rc6 -- and apparently causes a "hang" on some
> architectures. So shouldn't this be heading to mainline instead of
> -next? Ideally with a stable tag to ensure backporting to 7.0.y, but
> that is a separate decision?
> 
I assume it will be picked to stable since there is a "Fixes:" tag. From
the other hand i can explicitly update commit message with Cc: stable@vger.kernel.org

Paul, any thoughts?

--
Uladzislau Rezki
