Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925BE380FE2
	for <regressions@lists.linux.dev>; Mon, 18 May 2026 17:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779123942; cv=none; b=mxDGD6B0ReWpL9I2+A2S9gXagBFtK4gBAybdH6whPoyggZ/CRHkox6DZ6y56ymp40GbT+/tByhxf3BHIAtmtMSHtWaTB2iSfUBQQWGWA8yEnkBypR4OFovKHKVG+BMkCaAzb+YHeO+6vgwU1wXWV5aHQ7ME/cX3RN9qJ14qVSDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779123942; c=relaxed/simple;
	bh=m8SQUb8kqmTppEfGLOTBXcoJkkJkB2TKAa6me5v22FI=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c+i2H7IZ50CFMDoQxA0ewPu9fRu5baeILXMsSn1VubpigczcZvT0cRC3RLis5Y/6a613fvJykWSr0bHkA/aN9OedzNQ/G7A0RBfwSsNPh523ibuczBnEbLDZzuFoam5fz7mfRJP1huKTZYHsh3TMuaNKE71ewwbrvMjcc+hzNAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ASlvuDAE; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ASlvuDAE"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a40d02b58bso1932093e87.3
        for <regressions@lists.linux.dev>; Mon, 18 May 2026 10:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779123939; x=1779728739; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1aYdPPySXDTosAZCONGXYPhhFbBEQuaYinrf43tyh/0=;
        b=ASlvuDAESYnYhFAdHDIN+uYAzl4F/u4Lgq7Fp0omcy8AXAuyplKGTo+iOkF6F13YKN
         vnNQlT1O698QYyfWCTNVlkVg30x1P9DnGr2ZQyr45Njf5viq5YFEELpXCPxqUMSD7DaY
         sx1x3RrRLRlvaY5qKa0nt3VFUUqLXN8Pk2A0Ypd7ZItdJxAqFMcjn0RBhtZsSUeuehPA
         kbW6+139+5UDrpOtg5+vM57fdSLgzq9PHTSWMiedobDRkDaGv0Jl0oDRoIQU8NZJ1rLC
         8bf4LjgacR+gUObtTW+068fa8vx1J6FsyW/rbWNjldsMMzcjwlcCg+Qbk8HNLGy7g9YP
         V49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779123939; x=1779728739;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1aYdPPySXDTosAZCONGXYPhhFbBEQuaYinrf43tyh/0=;
        b=knAOnUSAvF9Dr8Vt3d3YNqsWzA56eyAuvMZI5WhNRmrpjMSOLfDcVQf8uBoFZVFd+W
         T9/ElHn2DDGEFVdD1kDW1ybsf9EYIRINDTZc4Fq7Hbnsk2Mw6DqF5p5D/RO26OEGYRI7
         CH0oim/Zna4QCSFiVlGh8TaMPKy4ZahcTtOKpmPOgLk2Bra27luvWecNNdK4h65qFWGq
         VkffzKmmKQ19gTZx+w1CvqOGVe9wLVLqpK4neB5agZTf19px+WfsXFzdC2gLT8poIsy0
         NA6DJj4bzyVeZTO9Z1FovMUAibEmJWZgcy+4SSaGqcj80Ur984yYa5eIl2oHt+qQKThu
         rhKA==
X-Forwarded-Encrypted: i=1; AFNElJ/RglS6qK0mEO5/jh9R6WF9u2etIEawWGBIXws1cxpnXIo6FCwIoJyMZL/BITzlEsAr0/LG11Q9gtJkvA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzWPS46fO4j4NNs5prB/qcyyjFv+bSMpgHMGhGiD9dhjfO9QhnR
	qS3LbDvC5X/4NFxTmpvWqnWcVh3dzWllkZQegw1kPWmoZnzYNKlUuq1g
X-Gm-Gg: Acq92OGiELHc3ClL5MgJ5K1TggDXYgPs+X7Gf7w1sLSECbMtdHQ0TtFVQNG4Os2Hnaf
	PtxZ1pFC7wwPa2r3G9Ro+2PI8k0BGaDLQCz5j/gAJUDAyHeRsY8EmrakgNsDCtR1eCNv12R4XTY
	YtaQnjdFEb1ysrdQlXn75d2J0KbMWmSz4Q9k4OMy/knbfidJoImw8fSA1uXi6OKbI+N8hkolXCF
	jFecYsSLiB1d8B23JWz/omLQ+UnJlpbhKGWqnd7/3xyLvbIiyFgc3uwvGwBIflImSmfMJLGG+TR
	Mju38bNj22yVtH+huvU5rpt5AifialM8e4+qEFPzD/ovrT+f1bW8MEnSGdvFGHj5c0mdPcL1Qih
	etxT/uS6p6JCm5BwAUi6OhNRHrgIjh8jcnCyoI+5aPml8tvneujAxefotQOtA62SUWAJRK4yfs+
	E=
X-Received: by 2002:a05:6512:3406:b0:5a8:e61c:371c with SMTP id 2adb3069b0e04-5aa0e7638afmr5741206e87.26.1779123938228;
        Mon, 18 May 2026 10:05:38 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164c5712sm3391074e87.59.2026.05.18.10.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 10:05:37 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Mon, 18 May 2026 19:05:36 +0200
To: Boqun Feng <boqun@kernel.org>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, paulmck@kernel.org,
	Uladzislau Rezki <urezki@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Joel Fernandes <joelagnelf@nvidia.com>, RCU <rcu@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Samir <samir@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>, Tejun Heo <tj@kernel.org>,
	Linux kernel regressions list <regressions@lists.linux.dev>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH -next v1 05/12] srcu: Don't queue workqueue handlers to
 never-online CPUs
Message-ID: <agtG4JmmyH1ycg16@milan>
References: <20260511175448.153326-1-urezki@gmail.com>
 <20260511175448.153326-6-urezki@gmail.com>
 <f669fbc9-c068-489f-bd91-4e81561a6e58@leemhuis.info>
 <agm4-6f-6rOgQPFB@pc636>
 <3dd5cce0-51f9-4cf1-81b8-246e6c6a633a@paulmck-laptop>
 <53d546e4-8db0-4e14-a79d-270212081be7@leemhuis.info>
 <ags6ug97zNR6Fiiw@tardis.local>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ags6ug97zNR6Fiiw@tardis.local>

On Mon, May 18, 2026 at 09:13:46AM -0700, Boqun Feng wrote:
> On Sun, May 17, 2026 at 09:11:10PM +0200, Thorsten Leemhuis wrote:
> > On 5/17/26 20:03, Paul E. McKenney wrote:
> > > On Sun, May 17, 2026 at 02:47:55PM +0200, Uladzislau Rezki wrote:
> > >> On Wed, May 13, 2026 at 12:38:01PM +0200, Thorsten Leemhuis wrote:
> > >>> On 5/11/26 19:54, Uladzislau Rezki (Sony) wrote:
> > >>>> From: "Paul E. McKenney" <paulmck@kernel.org>
> > >>>>
> > >>>> While an srcu_struct structure is in the midst of switching from CPU-0
> > >>>> to all-CPUs state, it can attempt to invoke callbacks for CPUs that
> > >>>> have never been online.  Worse yet, it can attempt in invoke callbacks
> > >>>> for CPUs that never will be online, even including imaginary CPUs not in
> > >>>> cpu_possible_mask.  This can cause hangs on s390,
> > >>>
> > >>> Uladzislau, Paul, according to the fixes tag below this change fixes a
> > >>> change that went into 7.0-rc6 -- and apparently causes a "hang" on some
> > >>> architectures. So shouldn't this be heading to mainline instead of
> > >>> -next? Ideally with a stable tag to ensure backporting to 7.0.y, but
> > >>> that is a separate decision?
> > >>>
> 
> FWIW, I'm happy to create an urgent PR to Linus with this fix. Since it
> fixes a commit in the previous urgent fix PR from me. Ulad, let me know
> if you want me to do it.
> 
I do not mind :) So i can drop this patch!

--
Uladzislau Rezki
