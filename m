Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A721117999
	for <regressions@lists.linux.dev>; Sun,  7 Apr 2024 10:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712487305; cv=none; b=EREbl95apcskVPVf+vFraQ4sBn+kByt+ccPSUCrI9thIhLphjksm3SASNfXygOVmOVmuNnj33FAtvpLQdJTw0GT5yKVDzBmJIyC1oSWvwhsQYmJq6+lUmQO/BNSUfEO0ZtSECAMybR6LH/nCO2JyYn7cmLBZ1jWhNHWHSxd+UBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712487305; c=relaxed/simple;
	bh=0FNkFT5QS5lBRnQ/rWzuQ5eMPzd/+jLUn2aoKvSyB0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dVF2qB1yDcMo6ndsBMLBDdMbRTH8b5zX6IWJA3sYDhNNpV2Qd8Dfkzay9AoWPQVHoF6Wtutv06FWa7rzC+XO0kdqLeNdLUFqWJSmSdETZwHbyVVF2bTHNG8YzQhWMlTQd1aeuQL+q5wY9ifGR/yAf1R7FUNIebaolKvHmkh1jMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eKBEpIgr; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eKBEpIgr"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2228c4c5ac3so2221526fac.0
        for <regressions@lists.linux.dev>; Sun, 07 Apr 2024 03:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712487302; x=1713092102; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hi6IMRhAW/p8+uIEIPIdvOce9xoFdjPwOwNp3TWqz14=;
        b=eKBEpIgrMjVaUkGZJS/ldbJ7+EdNvzSg1alG9sf9k/X3zL6cCVnfOWpqIs8BLngdUu
         vht5cCmJCFTynvVSRBVG3EMLdd7mIe/fCLHKaFiJcDMywTwPv36TePxfNywCCVtgqj2N
         P8h4fUsfAA3Cr6xvcPtyvridSaeH0WF06NeNs1F5N2G4S4mmvv8h2ufHuaDg5v7LHITb
         8ZqRka+9OxRs3O1RP/bd9C29yiy+3wTsNJC5q8f7de1E7YPnaY3sWeyNzF8Zd3CFJE7M
         2ZR8heSU7hoR3H/3jNFm8YwhfuxlNGoyoOdEM8/ZtaswZsNmYNfugVAzmO7yU7JvxZnL
         tk3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712487302; x=1713092102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hi6IMRhAW/p8+uIEIPIdvOce9xoFdjPwOwNp3TWqz14=;
        b=svPWc+iKK2uedi7P2rqD0M0Tr+IWhT9vFlFhGKotfzKFmuMp0gC8w6pEGW91m5AOoI
         ts9esiSrv0k7Eqylhf/UfpILcPJ422W/zD/o25BnVIWAJc7hcKyGAd6MczEmogilzPDb
         mNXIpyGN+4vJ2mLxlBcGpHsShh8uXvj23qka/WnU6YqH/l/qrplJuAdHU0EFpCpRUCeH
         sVpBkeojyBqVYpxpDZoQTiGb2re5Lg1F+MugCiDW9XTVbjOdihAgd95eDL+P029JMtfm
         1oMeXQ7kTy2Er16llhXzsKWd6kI2RD8HsuT9PRd18EPp82gMuG90qeJaA3rSDfMDtqGn
         cqIg==
X-Gm-Message-State: AOJu0Yy8gHEPaWnPsul6mhC5kbS6E+G9VJDqKb/ShSfwFHscevVBL4yL
	RYsah2dpuvAozl/p7MUwtp1SxF03I42MbpmGZ+sW4hZbjCf6Rvi4
X-Google-Smtp-Source: AGHT+IGgFKaNNHzF6DVMLndXuLCmjKQEvme5nIK3evzX5ufqHby78SZeGt98w7h6wxysANH3M+t1IA==
X-Received: by 2002:a05:6870:5694:b0:22a:1ce4:c0cf with SMTP id p20-20020a056870569400b0022a1ce4c0cfmr7378479oao.55.1712487302656;
        Sun, 07 Apr 2024 03:55:02 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id fn10-20020a056a002fca00b006ecfdcc2de9sm4607717pfb.10.2024.04.07.03.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 03:55:02 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 03F7A184690B1; Sun,  7 Apr 2024 17:54:58 +0700 (WIB)
Date: Sun, 7 Apr 2024 17:54:58 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux regressions mailing list <regressions@lists.linux.dev>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Emil Velikov <emil.velikov@collabora.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Arun Gopal Kondaveeti <arungopal.kondaveeti@amd.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Daniel <dmanlfc@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Sound System <linux-sound@vger.kernel.org>
Subject: Re: Fwd: Steam Deck OLED 6.8.2 nau8821-max fails
Message-ID: <ZhJ7gpvvkAiOXM5e@archie.me>
References: <ZhFJZoful6nEFskW@archie.me>
 <4d231dc4-0183-47e1-8bfa-3dd225bf8ea3@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4d231dc4-0183-47e1-8bfa-3dd225bf8ea3@leemhuis.info>

On Sun, Apr 07, 2024 at 09:47:00AM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 06.04.24 15:08, Bagas Sanjaya wrote:
> > 
> > On Bugzilla, Daniel <dmanlfc@gmail.com> reported topology regression
> > on Steam Deck OLED [1]. He wrote:
> 
> Bagas, why didn't you forward this to me in private first, as we agreed
> on as general procedure for cases like this?

At skim it was a rather (subtle) regression, so I forwarded it myself.

Thanks for the reminder!

-- 
An old man doll... just what I always wanted! - Clara
