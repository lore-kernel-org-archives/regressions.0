Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641071741D7
	for <regressions@lists.linux.dev>; Mon, 17 Jun 2024 19:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718654046; cv=none; b=QwioClqcpoklweZQE9uUGwFAWqUiJ+ZuOEL6jupX9MPObN5IPwBcGEIvYEOKr7XK/KALM9dnLpKtza8uxajIbJVzfkBHKTBkdwx8g8vcKJM5VuxysnxumSFTGwWVryOqZTJ+CricxVPpEgw6xCyFVBO00CoHtWYtEVb4Sufw2lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718654046; c=relaxed/simple;
	bh=DQqHUJXrZhYgytXar68LbEUwdnDFVthmbJrH6f3+M4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y/agpu4Y3vRc6ITNvobP4h2Z735HAhwvGNoFACxXvJL8F80LCdGziIs/MPdW78Np/TZcj920zzoRSt1T1HtOpXVVMZafJS4J27vpSlljGYrzIDgRsaiVOqPavgZlAGpLl/ySrtq2RsEIIp0luTALZNPwRByzeD8chLyCzwft3xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ksw8t3wM; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ksw8t3wM"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1f32a3b9491so38526525ad.0
        for <regressions@lists.linux.dev>; Mon, 17 Jun 2024 12:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718654044; x=1719258844; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DQqHUJXrZhYgytXar68LbEUwdnDFVthmbJrH6f3+M4Q=;
        b=ksw8t3wM4jxFYWrreGZ1lA7MWLatHb/btVhNqv0TQapYsc6/K8QoNkfoZCGw2uVgEN
         dGLLLgU83nZdHaxCeRUA/v1oE2vaOV2m2dTd0r1d8SCuZyMO0S7Uf2j382G3EReiXxe1
         vuHMW1AhlzPsiEpc1NZQgVUgjQLkG5vlvepA0EWUl5ZWo+rpzwhDSrNVHadtUj36gY3U
         qdnSL5x68QSQ2JYJz1/OT1/wx5fj++pAvg9Z/S7qBXyCLCEtsGAr6P7P6oKrI1rRbzLy
         jPfl6UGeGh7oiq85segbn1TRD8xfi5CAyxoUjUh6S9Fr78sjB/uZtCQ06eOy/mexlCye
         jxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718654044; x=1719258844;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DQqHUJXrZhYgytXar68LbEUwdnDFVthmbJrH6f3+M4Q=;
        b=sqpfs0+/q5OniOtyLbvShhGTIBK7KI9nG9Z/YZCr04xvGegkWzIJR8XE8ebHGZDY2p
         v927TKt17cO7mF2x7u7pvvUlHTaDvFplcdwfyJXBbX53ROfV/qeAA0FGOmuXWwhfF2ku
         CqqcHEYuY2JPbZf7zmPkMcA3vfF9DLhWjp+TKIUjGOz5w2aDJG/wifVnfmvTwwEZswlV
         +BX6wVJ63A4zVUQWKU2erEVjdL6FIS839TiiDPt+3ESRTns+JMg7+WxBmF7TRaaYU9l9
         Y4YaHZ85AnVLwxivs7IsWqD4sPiS/LQ6L4t81VK9V7Syrcl43y1dqse/RZRwBGdJxsru
         w4og==
X-Forwarded-Encrypted: i=1; AJvYcCVZgFBvpjNS/ax3O4OIWl+BsTq7gsjEllajvjNhZ6OrmRJhDHpfF3fKw2h12r2l1KmCpPmK5aWcyuGwMHk/h/5cv3aCWKDN8lwQC/c=
X-Gm-Message-State: AOJu0YzGOLggsGytQ6oR7098mZQzqKzAruoluQwcbJ5GkhDlv8VcJFN4
	xTS31o397NHoPNdklYenoTZBQdWbr6weMoIuFTaPzLbMczZyATl2
X-Google-Smtp-Source: AGHT+IFk8Yj6XtGc1pOKgW/lQjPMWfBclQjaJyUFTViDzfBUzpvXdVF/37gf/vWTdCZAGxJnR/ittw==
X-Received: by 2002:a17:902:c94d:b0:1f7:1688:9e36 with SMTP id d9443c01a7336-1f86290073cmr124274645ad.48.1718654044461;
        Mon, 17 Jun 2024 12:54:04 -0700 (PDT)
Received: from joaog-nb (201-13-139-53.dial-up.telesp.net.br. [201.13.139.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e55ebbsm83370875ad.13.2024.06.17.12.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 12:54:03 -0700 (PDT)
Date: Mon, 17 Jun 2024 16:53:58 -0300
From: =?utf-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Mark Brown <broonie@kernel.org>, Vaishnav Achath <vaishnav.a@ti.com>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	joao.goncalves@toradex.com,
	Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] spi: omap2-mcspi: not working with kernel v6.10
Message-ID: <20240617195358.v3ewnsu4jgkygvby@joaog-nb>
References: <20240612170030.3qatttsgrwjg2m5s@joaog-nb>
 <1b9852d1-4454-4f62-bd8a-fb6167dc0576@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1b9852d1-4454-4f62-bd8a-fb6167dc0576@leemhuis.info>

Hi Thorsten,

On Mon, Jun 17, 2024 at 11:29:05AM +0200, Thorsten Leemhuis wrote:
> In that case the thing that really
> helps would be if you could use a git bisection to find the change that
> causes this.

For me, spi stopped working in commit d153ff4056cb ("spi: omap2-mcspi:
Add support for MULTI-mode").

Thanks!

Regards,
João Paulo Gonçalves
