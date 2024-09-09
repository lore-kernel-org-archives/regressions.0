Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A180718B47F
	for <regressions@lists.linux.dev>; Mon,  9 Sep 2024 21:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725915824; cv=none; b=Pjb3eV7ojwdQlogjumJQ4zsS9P3f7gRLCUPawhfWXdEzDhIfnWjR13SEUrZoNabA6C4Ed53D6X3eBElxQyQZw8eaen/cMexrkzvJO+HAXv1PebSE4YGtW8abPegMR/ZPUgkV5tGn/ScDdPeCTD/XaWe/ZUtZnnjGFMZSLKdi6BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725915824; c=relaxed/simple;
	bh=kPZkZbhZJwYAMzzUbCZ4THsZ8GpHkz/92/0BokPESZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=maLIHGMitZ40TGk53iy/sG5MKzL/FJDqnR5762F9GI6I/9YMB1aGFZ1pziYuKqZ8gpkVk0eoYKljkqIusj9oo1t0uuJIxEnWyd69pRn/U32u7njCEUSKlJwyYz42KTqulmSfByJ6nw7T3rfc3cEkqAh0HOJeWYigU3+SK1jz4dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EK+RV1TX; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EK+RV1TX"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e1a989bd17aso5193882276.1
        for <regressions@lists.linux.dev>; Mon, 09 Sep 2024 14:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725915821; x=1726520621; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kPZkZbhZJwYAMzzUbCZ4THsZ8GpHkz/92/0BokPESZ8=;
        b=EK+RV1TXZ1WfkDXUA9pIIAJqniS0DFfKNam/ztrvtccfSiwgn1TBFRziKALwq5B5jr
         LWLD1J0uHSlVMQQ7saXa1vPxwMXd+IS7S/+8Z+inAPPBBQYJyF1aEObVNio/EEKoszST
         5L02UxHDTtbHpyYy0K520Psf1/qxbdLiAxCozBA5F6PL230qC90Vo1t9/rdktrb5fuqp
         euTiz2ywnvi1TTYUE6pu9kjoQGFoh6BwG7KoTnzVOeC+Tz5Wrko8f2wkOG09qe99dcvK
         YsXh1qhit3ni0x3siZ1NsT/Bd9YFBoFNktK8sRsZh2/TZdqTPzAO3RtCtMPDG10t20tH
         sSTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725915821; x=1726520621;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kPZkZbhZJwYAMzzUbCZ4THsZ8GpHkz/92/0BokPESZ8=;
        b=S6hYclhyMkTtgnYpgbS25tlJCSXDxaMNszmKlzgM+qMUFVIvLS8gr+h8NS5aQivqth
         1S4geqvN8cf+F22kL897OyntWruXdkQ4i+N2uiaXX608uYQ4MliMx0QX5rF3RbFU982L
         5O3OA5UberdPvR8mJNAImLWZM9kC29yxJsGIZLL7GUHsVVMuJlQI7vxfSYfHNh0UsVx5
         XXMDZxyJWKZO17A49aPKk9LduQ01TkPR3RMkNfrPmQBP7gtXuOkjbSV5JoOZbLXH2nuk
         5MghA1rZuh30ar59z2ypAZAzEP59wu79A1E19cqUYqTqB3ZahFeuokCWYh4hTrg3Ve72
         3H9A==
X-Forwarded-Encrypted: i=1; AJvYcCUuKrHhw9IvnqKfitgFMKO/T4dWP4qSJQLqYJl3xtA8pn+5eR8Y4lP5SHHa5JJD7VAIe9mlMOIPeswd2g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxQXxZzFESt2BqHHFr17xKcoBxSW/aYetaaOI3Tcwg+t4g+ehFW
	vO2DsEahSJhpvrMpzSwakfO5gSEtAz33DETt+S/WiGXcIym0Q5sWnIXtetIyf4n6YUGpljCfcvw
	9vwQkPYPkcpmCRDjuUTmpZyIfoCQ=
X-Google-Smtp-Source: AGHT+IFeCRkJtK2cCGzEFwaKQD5FP7VZYmZry96zQ5u2k62UkXW1CFVn/YEXOpqeKhmvGcxaL7bYqdhiaj5kI21t+8E=
X-Received: by 2002:a05:690c:67c1:b0:6d9:90f3:1a79 with SMTP id
 00721157ae682-6db451544f3mr165321137b3.32.1725915821450; Mon, 09 Sep 2024
 14:03:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAP-bSRbMbZe9LCE15SCbYNTGZjE_xiAm29qzO_WNVjHsJ6oyyg@mail.gmail.com>
 <9ada34661b93fa5dfe3b0c66816a62c1a27f22a3.camel@intel.com>
 <CAP-bSRZm4CyxY1VdtWvZRcfLMwc3njd3OTSd446Q5dcSfjJY=Q@mail.gmail.com>
 <d59125316423abd2f67e1c111eb54d083b7cc014.camel@intel.com>
 <d3a83162570aaede579ecde64e00350ce1e6b452.camel@intel.com>
 <Zt4PKMCp_FTx3kac@debian.local> <cd2ec07a08c9a51e0dfa5be70b35d39e5cc5e577.camel@intel.com>
 <CAP-bSRbmKvaoU662XtgjaPaOwR7fHZaJyrYxkpT=DfuCxwsJ4w@mail.gmail.com> <5b372558da9aed3a33e466970a64a5eda8f82454.camel@intel.com>
In-Reply-To: <5b372558da9aed3a33e466970a64a5eda8f82454.camel@intel.com>
From: Chris Bainbridge <chris.bainbridge@gmail.com>
Date: Mon, 9 Sep 2024 22:03:30 +0100
Message-ID: <CAP-bSRYNQVbzP6WNBMe2Ak_7w9b-=tXQ-9ktgK5XvoU4LFX2zg@mail.gmail.com>
Subject: Re: [REGRESSION] iwlwifi resume error, bisected
To: "Grumbach, Emmanuel" <emmanuel.grumbach@intel.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kvalo@kernel.org" <kvalo@kernel.org>, 
	"Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>, 
	"Berg, Johannes" <johannes.berg@intel.com>, 
	"benjamin@sipsolutions.net" <benjamin@sipsolutions.net>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Sept 2024 at 20:40, Grumbach, Emmanuel
<emmanuel.grumbach@intel.com> wrote:
>
> On Mon, 2024-09-09 at 17:16 +0100, Chris Bainbridge wrote:
> > On Mon, 9 Sept 2024 at 04:08, Grumbach, Emmanuel
> > <emmanuel.grumbach@intel.com> wrote:
> > >
> > > On Sun, 2024-09-08 at 21:55 +0100, Chris Bainbridge wrote:
> > > > On Sun, Sep 08, 2024 at 10:54:09AM +0000, Grumbach, Emmanuel wrote:
> > > > >
> > > > > Strike that.
> > > > >
> > > > > Can you please take the patch in attached instead?
> > > >
> > > > Sure, the error with v6.11-rc6+patch is:
> > >
> > > I expected that, but is wifi functional after resume?
> > > Not having wifi after resume is one thing.
> > > Having wifi but with lots of garbage in the logs is another thing.
> >
> > Yes, wifi is working after resume.
>
> Does it work without my patch?

Yes.
