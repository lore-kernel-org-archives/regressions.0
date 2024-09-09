Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D258F13B5AE
	for <regressions@lists.linux.dev>; Mon,  9 Sep 2024 16:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725898577; cv=none; b=X98QFyt5fB+0zoTRrhSAkfdg7KY08ag75kz4CXMW5UALj1y7yg4THSqRcoIyXIx2OFcHumOqcLLHrwMfxqTyA2ambqJQmSXg99MnEwH0l4x0k5AbNg6GnulXojERgeGO2SO7/7COxedGb86GUICkwtmk5zIYKoCnAwW2bM7ZbLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725898577; c=relaxed/simple;
	bh=yF4IcqmCMDCWoKEYbgDAb9hvl1UKIgWn6+PT26QJBfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aitm1AtrLdnIKN2leNEBXE+AL6SWXcFlsDdeIiPzU2cuo5++2LPngLNLMpsGM5hozJfH3JAH7P8GWrqHJThDlGnZgkPPd2aYzru9hIoNId9d8Nj0uKhw+zMlPkQXvjdKrzL0hrN/2PvSsPkevRgtCsKYupNXoEZbXxibNtDjXho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hsAjMAtB; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hsAjMAtB"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e1a74ee4c75so4816403276.3
        for <regressions@lists.linux.dev>; Mon, 09 Sep 2024 09:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725898575; x=1726503375; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yF4IcqmCMDCWoKEYbgDAb9hvl1UKIgWn6+PT26QJBfc=;
        b=hsAjMAtBSGJuwbrXp1zgwvNvJTfxOJsTy+HK0LcnTh/HqDdfwicHV3pXspYnIC2t15
         lbs110SNTulM2prTQcInC6QWPUDtfMQy+HU2EGTAKXwVamkVZt2YB4N40cPW6KxM/3Xa
         x+4sBce5UyKzL2F8MJueRRI+76v0nTasfXPTSwacfCAROXjw2mNs1cs/9cSmnU9mETae
         ZLedf71F9IzrqGFTA0+j20C14y+ayMZLvPQz2CzwGaWHSVMgLs6vYyZx1e5NbXYdjW7P
         ILZ+fIjWE+jXJJb/N5GYWnEP7mJaMqJsFLybIeXqX7G6W0FuoxMd9c4bN9feDtSXKlm1
         yefg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725898575; x=1726503375;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yF4IcqmCMDCWoKEYbgDAb9hvl1UKIgWn6+PT26QJBfc=;
        b=xN4+DisL396KXKepaMr0GW5EKh+rM+jzHCwLeX2K99HcyK9PfBFKgybJ9NcqYZiog9
         ZpOjSIniBLpN0Y//9E2+bJ5/DvuTd9g4ahfdiC8UgZ4kK6ACcrRrCR13XOi2ddO2h1g3
         DC5k8oxZR56xD1AHhYTUpf6sMF2RNqwNfmLE4bl9N8NZRU4X57nol8SeFzowcTLVSuiY
         eteFKjR8mGPBglMoZ9rNvzlbtT3XIaokiLPlkLTGpKSr7tqEBAUVZgvH9uaNbYiDqBdA
         G7YderLYxlktqqtQZ2YaSwbVCL1m/6zS2eeLb/yEaPqv85xt1Nr6s+siDqoWcHyuLyLi
         rlRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVw7m7lP8Cbaq18uuLhGYoUFHHRFAELTpik6lUXpWv9IhEjxgzlcGmPSdAl0b0yH2nEd8TCNI/Fxjpoxw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywq/NcjvGPogiJeDnOv8KBX5S8V4DsUoJz3Xj7Nsi1fHrPUJdiW
	R1tzev68UmKdJDzLxJzKIo30thrIhyEs35+31htKHa8zfMTRDHqDVRp21pvAcfNJehWF2CBhyu1
	fcjYqHbzdTKLBOxTtlL+9G4ZRbhU=
X-Google-Smtp-Source: AGHT+IE5myYfw1EWv/hxokhOA6Qn4KsSWVWcQtK/QRaaxCKn8a8jjN5pV/Dzm4k35N2vyg5SDWtEaVh8kKdrv4qh5rI=
X-Received: by 2002:a05:6902:274a:b0:e1c:fa56:9b72 with SMTP id
 3f1490d57ef6-e1d34a36f9bmr13517427276.47.1725898574820; Mon, 09 Sep 2024
 09:16:14 -0700 (PDT)
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
In-Reply-To: <cd2ec07a08c9a51e0dfa5be70b35d39e5cc5e577.camel@intel.com>
From: Chris Bainbridge <chris.bainbridge@gmail.com>
Date: Mon, 9 Sep 2024 17:16:03 +0100
Message-ID: <CAP-bSRbmKvaoU662XtgjaPaOwR7fHZaJyrYxkpT=DfuCxwsJ4w@mail.gmail.com>
Subject: Re: [REGRESSION] iwlwifi resume error, bisected
To: "Grumbach, Emmanuel" <emmanuel.grumbach@intel.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kvalo@kernel.org" <kvalo@kernel.org>, 
	"Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>, 
	"Berg, Johannes" <johannes.berg@intel.com>, 
	"benjamin@sipsolutions.net" <benjamin@sipsolutions.net>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Sept 2024 at 04:08, Grumbach, Emmanuel
<emmanuel.grumbach@intel.com> wrote:
>
> On Sun, 2024-09-08 at 21:55 +0100, Chris Bainbridge wrote:
> > On Sun, Sep 08, 2024 at 10:54:09AM +0000, Grumbach, Emmanuel wrote:
> > >
> > > Strike that.
> > >
> > > Can you please take the patch in attached instead?
> >
> > Sure, the error with v6.11-rc6+patch is:
>
> I expected that, but is wifi functional after resume?
> Not having wifi after resume is one thing.
> Having wifi but with lots of garbage in the logs is another thing.

Yes, wifi is working after resume.
