Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8794728A1D5
	for <regressions@lists.linux.dev>; Wed, 12 Nov 2025 14:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762957282; cv=none; b=V1+EkLSMhsPwzkZxFqPQJN3vIF/a2yfhlDLelIGviJqwopefvnnmNWzZF0INBhKDLG1HZka5qT8nCVc8nVtz5eV0BmfD/jf/vTd2oD4Z7fyRq6VRMoxsEbgcDnY5DayaXHrc2BLyKUleXbMqoGea2q5Ov3Gu5SNf9yyMmRVD+jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762957282; c=relaxed/simple;
	bh=z8azDrQfCbTnh/eAICunPS8UPni9lxX6G+FILYdc0PA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VoLrnJYXK3thPkeVogQYOr8iHMwlkYewAUWCJ9EYxvrFkwmUrd2Ea4lCqYqvgifY4DEOC5y9cHMHs+Ux1tUT9BIgB6noFBpWVBwMcxVBvtdMDKf4qbzfc9Mhwao1f1YUB7NGvNDcRuTAPZoKdtyT5/MZ1jNt08zs7mG5nuz4Zg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=DSh/DwSw; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="DSh/DwSw"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4ede4a30a84so1399311cf.1
        for <regressions@lists.linux.dev>; Wed, 12 Nov 2025 06:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1762957278; x=1763562078; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fs4/EC6pmGsjRPn/1ETAcOVDxQD0pbsc+dq8Lxdo7sU=;
        b=DSh/DwSwWaX+c4tvlMToM3y/javupiTCCeQps6GGdedKp7nbtzFYxu+1tG5DTyd6yB
         0Yy7OHsmXPNDvPPdMX23mukJ/QRumNRDT0M1+vhsW9lmuKG+vwq/m/hFIm7Lcj45nZmS
         zIoVa5Z3DSLLdasvLZWLviM5dofGo62QWsmVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762957278; x=1763562078;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fs4/EC6pmGsjRPn/1ETAcOVDxQD0pbsc+dq8Lxdo7sU=;
        b=ZpN4zO03zdkKZZIbWayEgXzW5vQEPjZldIgAnNGg6YyN2+2HdisvrRqPGxUS1CT5xt
         QtAsoEkhxWGow3Sib42GaosIfSjJVVNL9UO0szaDq92MOe8FoU6JG0dxChbPglyCWEZe
         k/fUqIS7XvSXMcPb30Mqq46QoN6tizsRl/9N3lWPtgi6VzwInaLE6J5lyxD+hfRBMI4+
         8fFaySml8gdPvsZmU+xqOaC1Elu2jinLtJO9PxVXbhU5AomQKHWm8Ow7N7QjJUswmkk4
         fGC5PFvo4EloZNkIoHtaRYCmYN7y2T2RKx3jvuyOQ/rZ3sVb4TLyzuEywM04YMym+iHJ
         p98Q==
X-Gm-Message-State: AOJu0YyGyNeMLOnu6wOep30tWMLzfTQ9aoNj0GTXeylUSJMBCluSyWOK
	lsuBPCmannnXLlO1Tc4ETzT55nPeXmmHaB8PN3z5+K0MvzRgK0vVZX/bQXgyTb6onFFDuOAAhV9
	MRMXFxa6RvF28LBOx7EpnCCNa3gmJ2HvWYhndI+XXdw==
X-Gm-Gg: ASbGncvTi9WI63nUZ5ok+LzKNDJzTXSCmkrqKBUks5wjH7YdvHLh2Q26YcE9/yatRoc
	XahhZiwJ6FK064ZNb2cL6pyGKwcEzCMrgnfTHJ5QyEkfbMY0HmsmGue8YJiDqWe6Y4n+qhb4jjF
	NN6pK8FJ3oZG7IqesmfNlQsjev8+/zahnr6+TpFrUGD7y0BquJJchgX/WR1XZqtnuHL6ih1STUV
	oif71YV+6i7Furx1ppa5hX/rB68KwqLQPu4hlg0gd+cgw+oDx3nNnn4YMk8
X-Google-Smtp-Source: AGHT+IHKo4fr9VJxF86jzvlsGLZDT2/SQ7hKOiu/Z3S/ZNBNuEriQjtlL9ppWMOxyb4xpe3+92EsVYPdsbiuvMJ5wLI=
X-Received: by 2002:a05:622a:34e:b0:4ed:801c:8c24 with SMTP id
 d75a77b69052e-4eddbcccd56mr35351591cf.3.1762957278165; Wed, 12 Nov 2025
 06:21:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <mwBOip3XK77dn-UJtlk-uQ1N6i3nwsKticZyQdPYzQcsk0dsjXl4oOAh-Neoxv-0TlpKnt_FEJwx8ses5VJglGLJUW-bIG8KWchtoDwCnnA=@protonmail.com>
In-Reply-To: <mwBOip3XK77dn-UJtlk-uQ1N6i3nwsKticZyQdPYzQcsk0dsjXl4oOAh-Neoxv-0TlpKnt_FEJwx8ses5VJglGLJUW-bIG8KWchtoDwCnnA=@protonmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 12 Nov 2025 15:21:07 +0100
X-Gm-Features: AWmQ_bldtGLmhvFQFCJ1BHag9YAX0QEgFX244qo001aDC85LFkOh1WRFejUHlQs
Message-ID: <CAJfpegub2tvtvJw_rrJ-E5LeBg2S8+u3-NKnE_Bi6Y=cDhFk=Q@mail.gmail.com>
Subject: Re: [REGRESSION] System hangs on suspend after using distrobox container
To: Athul Krishna <athul.krishna.kr@protonmail.com>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>, 
	"joannelkoong@gmail.com" <joannelkoong@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Oct 2025 at 18:47, Athul Krishna
<athul.krishna.kr@protonmail.com> wrote:
>
> Device: Asus Zephyrus GA402RJ
> Distro: Arch Linux
> Kernel: 6.17.6
>
> Noticed this issue after upgrading to 6.16, systems hangs when closing the lid of my laptop. The issue is triggered by using a distrobox container.
>
> Steps to replicate:
> 1. distrobox create --pull -i docker.io/library/archlinux:latest --name test-container --home ~/Containers/test-container --additional-packages "systemd" --init
> 2. distrobox enter test-container
> 3. Suspend the system
>
> Bisected to commit:
>     commit 0c58a97f919c24fe4245015f4375a39ff05665b6
>     Author: Joanne Koong <joannelkoong@gmail.com>
>     Date:   Mon Apr 14 15:22:10 2025 -0700
>
>         fuse: remove tmp folio for writebacks and internal rb tree
>
> I was able to temporarily fix the issue on 6.16 by reverting 0c58a97f and 7d0f0f06. Unfortunately reverting 0c58a97f on 6.17 causes huge conflicts.
> Attached systemd journal logs.

I can't reproduce this.

And I don't know what is happening because the sync is done before
userspace is frozen.

Can you get a sysrq-t dump?

echo t > /proc/sysrq-trigger
dmesg > dump

Thanks,
Miklos
