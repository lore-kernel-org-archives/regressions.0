Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D9412E1ED
	for <regressions@lists.linux.dev>; Tue,  6 Feb 2024 10:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707215028; cv=none; b=VMftxCXRm0NN0ohcJGJqI6xeIPpkOmNWqJ4nQCg1V/nTmSwN8A6tbP8OtF58o8A3lsu0mmv8R8BRxcChBUDQ0ttR87tLawC1xkRV0ttPRFM2W7mAyCm13TBpD1CkpSIDED3a7XOk0jVn+GXV9pM/MfxPHVrE+MsMrHwecp/F2Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707215028; c=relaxed/simple;
	bh=JQc7I9dtacgIh6dzApcTtL71VyIWn4aWCD9+Rsus/uU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OIqSoo4tjjX9Mow8PZmwEV9QbDx93TDg8r6IfuhOdW7odKiuag7cgCDAUxXDoAt/BEf3gypT+luDeJlzWN/RPOdEvdNPJMtLrggLTDDPOqzZPijqZ3E3LqoHDaydNoO1J/YcnEPDQ2a1s2IEmfySrAuwOtjPjneL0YCyheFecJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dgZn0sZm; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dgZn0sZm"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-4c033928deaso299009e0c.0
        for <regressions@lists.linux.dev>; Tue, 06 Feb 2024 02:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707215026; x=1707819826; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DvZiY9ihexG/Lq+UzYShBWDLaHBQcaLwobbBS4o9zoI=;
        b=dgZn0sZm6Gwi0ttMgdbmmE/Gkd8LJDrsN+8iEdRj7nlzm8/cFqyu46P04wywXOw6cb
         Z1G4Q0Cpz9al84KyYuMbU/AUk4H16KGVy1fWA12VDMwn+HY+f28TmuG5r3O3gbPeAshZ
         Ry7tQLaO5q4jNRY0XIT06mQYrTTWePVk69sZUwCwtdvasxZiktogd/e0SWgNtUMeYWz/
         PBFLpAB7e2bT5Ekm9aVryeWMZzxxGf0P2qgbvTW2GfAzW/2iAwIzAVPI+7pC6TGJUPwQ
         dXq96SG3FYsfzDGmaY0AR/qg0/GmNbvVdyyBQiaqs6obeu9sz4DRuSRtRrqyeBMxiasI
         CyDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707215026; x=1707819826;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DvZiY9ihexG/Lq+UzYShBWDLaHBQcaLwobbBS4o9zoI=;
        b=FDdmNour8DP6elEuEtKM2ckptNkkubbmweDqET1t7fMFzpUdHeko9FWIzX93y43QKL
         lkyibPG4TjRXOPvCl5FTY0DaXsCYp1ExUZUdEHEusJekY0fjWqJE23tlXkxjEwEA/jTP
         pK/R/axg3Fxs8u2BImhWwjvPo1MEya/GLpun6WnoWT2ggiCiHJQnsX+zfReviRHRq3fx
         OQUvftzkZpqAm6I14XC2wXdjFml8zrhuQPecrnGuNVBYFp2T2xMk8KLw/7xaFqeLNZ4U
         KgjN1X/WBk2aj3LP5rPHxYzC4pWevsPJmTooQn9xf2R8VHwyx5RRQcoqSvqr9wVSywHd
         RWdw==
X-Gm-Message-State: AOJu0YzjNuJiMffoXhqVPCuu5XKVPbZRg+mbIudPC2xZV7kEhEttoyWh
	cXHflzSi62gZk5BMvBhnFuYEeIHJIymhRzc5XNuc9KZevKcbE7ZkYNHPrKno/7eZOlUNdIYqkQi
	CTVvnpvmKiGy+pGJrHRSFKrnTtbVUt2r9IDF5gg==
X-Google-Smtp-Source: AGHT+IGfDOnd2EhP4TWByrQOkcid9KL+1EpEAi8LxcA+nJejScdKhoTZckC004/fc+VBarRks/cvEIzLg7CHcNC2TZ8=
X-Received: by 2002:a05:6122:17a8:b0:4b9:e8bd:3b2 with SMTP id
 o40-20020a05612217a800b004b9e8bd03b2mr1876525vkf.2.1707215025681; Tue, 06 Feb
 2024 02:23:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYttTwsbFuVq10igbSvP5xC6bf_XijM=mpUqrJV=uvUirQ@mail.gmail.com>
 <20240206101529.orwe3ofwwcaghqvz@quack3>
In-Reply-To: <20240206101529.orwe3ofwwcaghqvz@quack3>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 6 Feb 2024 15:53:34 +0530
Message-ID: <CA+G9fYup=QzTAhV2Bh_p8tujUGYNzGYKBHXkcW7jhhG6QFUo_g@mail.gmail.com>
Subject: Re: next: /dev/root: Can't open blockdev
To: Jan Kara <jack@suse.cz>
Cc: linux-block <linux-block@vger.kernel.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, linux-fsdevel@vger.kernel.org, 
	lkft-triage@lists.linaro.org, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Feb 2024 at 15:45, Jan Kara <jack@suse.cz> wrote:
>
> On Tue 06-02-24 14:41:17, Naresh Kamboju wrote:
> > All qemu's mount rootfs failed on Linux next-20230206 tag due to the following
> > kernel crash.
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > Crash log:
> > ---------
> > <3>[    3.257960] /dev/root: Can't open blockdev
> > <4>[    3.258940] VFS: Cannot open root device "/dev/sda" or
> > unknown-block(8,0): error -16
>
> Uhuh, -16 is EBUSY so it seems Christian's block device opening changes are
> suspect? Do you have some sample kconfig available somewhere?

All build information is in this url,
https://storage.tuxsuite.com/public/linaro/lkft/builds/2byqguFVp7MYAEjKo6nJGba2FcP/

- Naresh
