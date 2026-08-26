Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65CF46A61C
	for <regressions@lists.linux.dev>; Wed, 26 Aug 2026 18:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787767886; cv=none; b=PLSShpNNeuDfNGCLPN64fbXWmMYnAZMvOiDEvchgY628oGRIDXvHuWyOpru7fF4lOut6zy5U0ilKQuzUw7ZxUE9I4Fhpm1liBkw/wxuQ+uKJsTelijPcds5hLflNrUvDZ1L4ensdd1t32E/sOq84L7ZDzrAVtwiiVp46vbaOgFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787767886; c=relaxed/simple;
	bh=hTwLH6239DZe5yRPzb2V1G2GAB6G4ulnXpvuKPufiFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jKiClNj4lNaY19EcJS7gzJF3ziKDmixrjU9DWtaUjSCsvPbsrh3BywmvjNhatGsxvakkUeI5tuK+nDop/xSUc+qnk95n4N23evVeV1v8C6sqcZuuZmS+dzN1QLYmPubFt41axMr18VU+yR2T3wBm/fxcVhBsKSCWV+ChAujbwpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j+DktXkH; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j+DktXkH"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so982551a12.0
        for <regressions@lists.linux.dev>; Wed, 26 Aug 2026 11:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787767874; x=1788372674; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cD3ENK5Zz4cqB8cAmknAH7JmVcmInLZ6RJTKj7LW1gE=;
        b=j+DktXkHiwmgTJHv3PkYoAZ8f2na/TaR+Nqirp7q0LjDsyl/FRsnpflJqAVTcJLp5d
         oz2FvCrtWyOemtFn9oFq3QZHfhFftBMD6P7ZYpHaVgpWWEdJZ7+BZIEoPH8wL58PW0An
         /0kCKdTaqJyK8ufXbmheMHkkuLBgrc2VqmYa7W5vefoxLoq59666BQactI3K7p+nzyPt
         vdNZrcju0dyqekJ1bkrOF1YLyIwD1tJlun/y7ETVOgkSSA01l7ifJNFy4F8tf5bk+vBg
         lOj3jX/P/01k/AcaNtJuYrmhdhqf/INjxdxCb/0G9lxe8EbTbM9g3PV6fJEPGJQrkmML
         V5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787767874; x=1788372674;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cD3ENK5Zz4cqB8cAmknAH7JmVcmInLZ6RJTKj7LW1gE=;
        b=LKvUlPXCotIPYAX/tpLfkmKT1DUhrWaPD/6KmXp2DeBVUXog7Ms83O9bvoqQQKZ+vA
         EOZmfPiBA2oIyiYIckF/c6980Ucg67ae5X+kyGeDqiMmeV9Az8V3PaGYPIE3l0v2yapy
         BPK0XTyZU1To4gkR1+sh9QRiPCNqBJdvYgq7wvrdSwqvWPQnFXXQ7K67DdjgxX5yFy8J
         iYXjEkUf38oafE7U2qCpR3ljGt2V28e1gmQH59bOMr+v7Xa9v86lQmMpynC99dFIQ5BG
         gC232eZFtWYlp9qwMy1j4SW/dGTiQj/Ym9hkLxbHarZfFVaBiqOIh0Y8geRMeIAZMMBD
         kOFw==
X-Forwarded-Encrypted: i=1; AHgh+RqwfYAe6MxPLiR1fxrI9XL3LCHxmdzf385eDtycqkuDT+VD/J7My5dKsHQWVIfvXUh6qU/E/yuzYsoJKg==@lists.linux.dev
X-Gm-Message-State: AFuF++l3l8BcL+dW3GJNuTQuWtDs6v+JP7Z9WCI2cd5wVDaf9KP2xgxr
	E5+Hak+tZEki/hOscTj/o4ljL3patx/yTqAe4Es4YOdbIIzIK2SU9SiN
X-Gm-Gg: AR+sD12aSp6Nh0oBcs1S8bHHlRGAvslxCKcdm9/KmBQgCz9p8M41cnsY0sOX9PqKZEG
	sTJRRTyN35T4uhVTiC8CJW6ZfYf5nJsJwKwOyI0f2wOoujUsoadV+Sym/7LFuBCBHjAu6CDrODP
	a6tIBXsvWm08ax1cBZX6S2B60CgcWUFzLpUuH/x+3AIg5lPFKAt2KYbxC5JxazZnhvV0kgBfiEJ
	Rkot3teKvZDnsG5soJjP1mYRmnqfBLVgZX47dDlibBa/jhwdKszIkJoB/tMYnvxdN4dAjwWP8za
	fVF2BAT8rlY0beEKVwcrUkmLTSLTZ6ANw5eP7dkHQ7rtY3ITeSCsiB/HNI9zn0Baz7ZNqEPP+1J
	B8EZjwJppXHzBBe4P83INc1Ex0NurGHqupJVyAURStIzXENwz9q9KHqj2o3Xtw4akQcJzvqR4ja
	Nywj6H9aJFpbSn+uNvdkBI2l6mttzVIM3+k0o0tF+zklSmb2e4XWK0CirK15ykIiCPgd+dW5jTj
	/r3sXa4FXJThK3FK+nUaPjgBE3zDSlW
X-Received: by 2002:a05:6a20:6a09:b0:3cb:8810:631d with SMTP id adf61e73a8af0-3cf7596814emr15778521637.1.1787767873764;
        Wed, 26 Aug 2026 11:11:13 -0700 (PDT)
Received: from localhost ([2409:40c4:3158:4e86:4090:3289:19be:7446])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32854db74eesm957162eec.18.2026.08.26.11.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 11:11:13 -0700 (PDT)
Date: Wed, 26 Aug 2026 23:41:09 +0530
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Mathieu Fluhr <mathieu.fluhr@gmail.com>, 
	Michal Pecio <michal.pecio@gmail.com>, Thorsten Leemhuis <regressions@leemhuis.info>, 
	linux-usb@vger.kernel.org, regressions@lists.linux.dev, stable@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mario Limonciello <mario.limonciello@amd.com>, 
	Forest <forestix@gaga.casa>, Slavik Dev <developer.slavik@gmail.com>
Subject: Re: [REGRESSION] 6.12.36+: usb: hub: post-resume delayed work
 triggers > uncorrected MCE / data fabric sync flood on Threadripper 7970X >
 (bisected to aec11e5f9c45)
Message-ID: <ao8bM2SrASNh2u84@eggarch>
References: <CAPyJwA9P48LDcOr7u_iT1WPFBCHxh9w6cxFvyi5GS3syM6crbQ@mail.gmail.com>
 <07435e6b-ee30-4c85-8c8b-0ce3a4ead1d9@leemhuis.info>
 <aosGtkE_diwVJJtB@eggarch>
 <20260823174059.46fec036.michal.pecio@gmail.com>
 <aoser8dLytrwqBC2@eggarch>
 <CAPyJwA8m_Xd2oyV1i9k+-6f7A-j0FiC97yXL=Ci8ZAErs5W4vA@mail.gmail.com>
 <ao1ovvdPAy6n_F7I@eggarch>
 <CAPyJwA-QALkCQn8J1+=U-nuE_7WSEPhVcUEKb+MMYMaA_1AVjQ@mail.gmail.com>
 <ao7aLXk9q_v_jEyX@eggarch>
 <d5a395f7-06ad-401a-b026-e975f620f017@linux.intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5a395f7-06ad-401a-b026-e975f620f017@linux.intel.com>

On Wed, Aug 26, 2026 at 04:40:14PM +0300, Mathias Nyman wrote:
> Roothub needs some time to settle as well, but 200ms might be excessive.
> 
> xHC can triggers wake (PME) when a connected USB3 device starts signalling wake,
> but port registers changes are not always visible to driver before link training
> between roothub and device is successful.
> 
> My educated guess is that 120ms should always be enough for the roothub.
> This is also the lecagy msleep() still apparently left in xhci resume
> to detect port changes in xhci runtime resume if there are USB3 devices.
> That msleep was supposed to be removed now that we got the hub changes.
> 
> This 120ms can probably be further tuned for roothub in some cases,
> especially if resume is due to userspace action instead of xHC wake signal (PME).
So the patch I sent above unintentionally brought the total hold from hub
and xhci side down to 120ms, which worked.

And the correct fix would be to bring USB_SS_PORT_U0_WAKE_TIME down to
120ms and clean up the msleep from xhci_resume?

I can prepare a patch that addresses both if you'd like.

Regards,
Lovekesh
