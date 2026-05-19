Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D9F40963F
	for <regressions@lists.linux.dev>; Tue, 19 May 2026 13:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779196747; cv=none; b=M7HyEXlN5o31eaXYuIgJcBR4VLIXHmYiwxZC5Ur2TqSB4fzB8QhTMH4zv1VUaAI7eVx+fq8QVm2vHyBmGLHnL60ZSkaP+bKG7FLupr/Np+PMDYqdZ0k4VOcAV2hUbGbnNrZDv7tu12a/quXvQj8HR0Rwa7tEyZy69wtxKK4yEPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779196747; c=relaxed/simple;
	bh=bj1q/EztfJJU5GWMwa6IstXsS/eEjz5iuLTnwo0VwBo=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UzNZ62Hu7AEfcS6dP9oTEFeiOciOF5qoUgZYnDzYxLJC6ZG1M2/MU5AUgFV1i9YEI6iCDLBtBy83xHp0/+pxsfQEVNGjW1TFdK6BGGP38OZ0YJYtBCB0dH5wxSZN55m+y3KI/QEA36I76kFtyHz/gxOC9b26PLSIEKPwHcuuJQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D9m2iKwP; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D9m2iKwP"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-393a49d2e5eso33872011fa.2
        for <regressions@lists.linux.dev>; Tue, 19 May 2026 06:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779196743; x=1779801543; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1VUcKWR6tSOqnS3x6S3T/ExY2OOAzTCVhWmP/IsAKgs=;
        b=D9m2iKwP4Q21HJNEamkoR9p4jVwe1/ca2Puo2p5gO/vLStczYRwiqMgXjvlAuaApVN
         l7eqgR9YpocCGz4bcQMtHrj6fQkpFGI+bPxrLCy7fJtajKYkQxAW/W2xFqxt72VtD4PG
         e3XphmxfriPAw14iBWrDYR63glcGsqRAMFYeXHkGb+Jt3pMtVliA6xjic02L0IzcFPIE
         NWiom4VfMKcU47+8bFutro4MgoNi+QXpdUgJz0drK+AXJ89k/jl5FjryP05MrNPYV+Sg
         y1MpBFAPt3u93rT88Tq9ibf9TTZnkmVbOjHM47fTi57tRzEkKmY+16aDBIzV2ouNBWSK
         ucCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779196743; x=1779801543;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1VUcKWR6tSOqnS3x6S3T/ExY2OOAzTCVhWmP/IsAKgs=;
        b=UXuJSWIxgjDkZtzxmqdDiodEjhkxUD/oeAQ8g8phmowUHpnNqYINq0Np+uF5ohFLxP
         k/ggEWXxxwR9e9yB3k6GXfUcA4mbcsqKqe2foxIgaIxM7qEH70oo/tAn8eqILIXqHzT2
         4RCUYeLyNdkZVtiVxBN4mPdXLXoBLkLHBQceOS+XII1dji72gbLIFKU50uTetFVdLXEO
         E1TwTijheKhtHu5EaSIP2LiLZ/LZEeVFdDTAXIuONZAvWmfFEPTYI+PBNDUSfQKdc66w
         4rPVYnCZvVYtNjIKW+yXXCIgZwj5Lh15YMYRZjJG6YvhMHNjyg6vS/oJKrVZgKI0DmOj
         9jdw==
X-Forwarded-Encrypted: i=1; AFNElJ+PzfBimd8TRPKI+FHeYvXCb7Xi6giUgOx9sbxQCJVbnbOibLJtJII13PThj7Y6m4Lw1JQ4nFYvxUbpiw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzh5wGhbPp608k2/83ojvHbZnGwlj9lbIn1tmzp454+f6gJDXYq
	BZKWH7/WMzVzaT3HrLxZY4RFjHaQoQ++ZNV8StuOgj+qYW7SonLvhuel
X-Gm-Gg: Acq92OFQm5OmkOdCV+8FLdWu4NwFc7dHwWZQsoRoMULg6R5O8QEF+WoJMRGeS+T9mRJ
	6duhtLqlBZMFlV99zOy35HLt2r+MbK9dDQxQCCPIyp5O70/8V0bkpiXRASlKaWK45trrRmuV5f3
	rCnkJHvhAQZ5rg3+2NnQh1LO7HY3MZp1YZommOrI/zQNrQoZ/eRVpTEtaZINy/2YnER+qqMW1Ez
	GA/kvTOnSu6U/DABI4Bq4XkGI/2OkuNNoENdyZMk45YmqTnhlS+Reg0dNWg1US9ft/ZuG95ztKu
	rv2dWjw1VLVMa6/qAdudpxoNffmyW4Mb23iLzOXYndoYSWnoxf0ApeoWvUUAsHbQQEGb4tcVIyJ
	q7+GC4enq/NZbC4vxlFarJN8M4REbzMe1cTqTwosHLNESPJXPZrnIGzPitfW1ECQt
X-Received: by 2002:a05:651c:555:b0:393:903c:2256 with SMTP id 38308e7fff4ca-39561faac30mr55035051fa.26.1779196742768;
        Tue, 19 May 2026 06:19:02 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3958827ec4csm19757351fa.4.2026.05.19.06.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:19:02 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Tue, 19 May 2026 15:19:00 +0200
To: Boqun Feng <boqun@kernel.org>
Cc: Uladzislau Rezki <urezki@gmail.com>,
	Thorsten Leemhuis <regressions@leemhuis.info>, paulmck@kernel.org,
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
Message-ID: <agxjRHuAnzHFDqD9@milan>
References: <20260511175448.153326-1-urezki@gmail.com>
 <20260511175448.153326-6-urezki@gmail.com>
 <f669fbc9-c068-489f-bd91-4e81561a6e58@leemhuis.info>
 <agm4-6f-6rOgQPFB@pc636>
 <3dd5cce0-51f9-4cf1-81b8-246e6c6a633a@paulmck-laptop>
 <53d546e4-8db0-4e14-a79d-270212081be7@leemhuis.info>
 <ags6ug97zNR6Fiiw@tardis.local>
 <agtG4JmmyH1ycg16@milan>
 <agtowPsNCB2LioTN@tardis.local>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agtowPsNCB2LioTN@tardis.local>

On Mon, May 18, 2026 at 12:30:08PM -0700, Boqun Feng wrote:
> On Mon, May 18, 2026 at 07:05:36PM +0200, Uladzislau Rezki wrote:
> > On Mon, May 18, 2026 at 09:13:46AM -0700, Boqun Feng wrote:
> > > On Sun, May 17, 2026 at 09:11:10PM +0200, Thorsten Leemhuis wrote:
> > > > On 5/17/26 20:03, Paul E. McKenney wrote:
> > > > > On Sun, May 17, 2026 at 02:47:55PM +0200, Uladzislau Rezki wrote:
> > > > >> On Wed, May 13, 2026 at 12:38:01PM +0200, Thorsten Leemhuis wrote:
> > > > >>> On 5/11/26 19:54, Uladzislau Rezki (Sony) wrote:
> > > > >>>> From: "Paul E. McKenney" <paulmck@kernel.org>
> > > > >>>>
> > > > >>>> While an srcu_struct structure is in the midst of switching from CPU-0
> > > > >>>> to all-CPUs state, it can attempt to invoke callbacks for CPUs that
> > > > >>>> have never been online.  Worse yet, it can attempt in invoke callbacks
> > > > >>>> for CPUs that never will be online, even including imaginary CPUs not in
> > > > >>>> cpu_possible_mask.  This can cause hangs on s390,
> > > > >>>
> > > > >>> Uladzislau, Paul, according to the fixes tag below this change fixes a
> > > > >>> change that went into 7.0-rc6 -- and apparently causes a "hang" on some
> > > > >>> architectures. So shouldn't this be heading to mainline instead of
> > > > >>> -next? Ideally with a stable tag to ensure backporting to 7.0.y, but
> > > > >>> that is a separate decision?
> > > > >>>
> > > 
> > > FWIW, I'm happy to create an urgent PR to Linus with this fix. Since it
> > > fixes a commit in the previous urgent fix PR from me. Ulad, let me know
> > > if you want me to do it.
> > > 
> > I do not mind :) So i can drop this patch!
> > 
> 
> Alright, I created the fix branch at:
> 
> 	https://git.kernel.org/pub/scm/linux/kernel/git/rcu/linux.git/log/?h=fixes.v7.1
> 
> And I'm going to throw some tests on it. Will send the pull request
> tomorrow.
> 
Cool, then i drop this patch!

--
Uladzislau Rezki
