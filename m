Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52B917A2EA
	for <regressions@lists.linux.dev>; Sat, 31 May 2025 21:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748726205; cv=none; b=n8JKpHVQo2KqM8W957T52Gu/RfD120xjRqGc06x2VBzwhAasMLq0XThHfJvqjEHPK4Lwj7VLa1sZnkvlzZDGh/+WmICo0272//SAuj/9p6Nl/84VY0RN90SmP6wq474gVGgGJhFg9E0Q0W1k7uCEZC7xzr6pXGlF0pcHWd8iXIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748726205; c=relaxed/simple;
	bh=EUvczlQzZiV+h+BBDfrE5Xd/wQgSlMczVyOkVpEO7xo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kIutFGpfN60MQlnd/5Jpwj/Y0PTi0MiLQ6rUkTV84v+u7jUHHGU3/rKYTy+nXo7rgq2ppoj+27Rd/VxhTLIMdL6FEDcda8iyDWt642yVjNRiiWMoEM8oPGen/NVW16t2S6IsdgyoBcrqqczLr8fykS2afrhojl/rf1F1doyvl60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SCjWZKHq; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SCjWZKHq"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-451d6ade159so260185e9.1
        for <regressions@lists.linux.dev>; Sat, 31 May 2025 14:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748726202; x=1749331002; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D6C5boLECn1PDP++AHk6Kl4LYmMjXBe67l9wKYkBlSg=;
        b=SCjWZKHqapss9An2tgXNgdHcokk35zHSQGEZB7dX2t7hq9VxZzyCXATMFYjkyVwDuH
         Nx21LodPl/q5P7w2P9ddIBZjSxFcoqr6HFxo4fJh9ClUJ6tfXlB7RBgTEjn1jM8CZBNe
         /gi18dAVcpSOeYb01IBwlaVZGkgHsZ2gTKXmJXHGJyGX5gbzY04uTipwhYNEALO3yOCM
         qQJtCr1anRBcg+V697CTqMEbUtOALk0jDlrAokRWpFuhN8piN5N+wzK12sWcsHyn2fa+
         k99b54Rd+I/aqSppwCQAhjyrfOEBP4vmK2roCdlWSDuXFs6g8ioj2BB6Zhd76Wvafn8d
         pFKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748726202; x=1749331002;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D6C5boLECn1PDP++AHk6Kl4LYmMjXBe67l9wKYkBlSg=;
        b=i10VvDJ0Ie6H1E4nW3gpMp3yh35iU8f6q4etHHXxrdufPnphYKXTU57S+0dwO9V1HU
         7m4oyez6f1ploTe1BPOn6TrgBF+1XvYRCEh9DzF5P6gAqV2D4UP1mCyR2Cr4r/8IsgWG
         S+Q++FhZnzE9B5lCHg84v8vav5GekT1XgJDX0sqrE/ROp0L+zvqdr1fuKXJv1W3Rus+s
         tnd2Lls54z5XP7WZb1Yizy4kVvbu9x7PGwATimaZGlEkanI0+g71iHwKLahallwoT4Fy
         286e0XLmRc6DkuBwuiAgnAvhcHCCPT1XbNyM0TNjwAQTkztU0Qhwy6VC9MUliGkgzMTV
         DrlA==
X-Forwarded-Encrypted: i=1; AJvYcCVAUFClxeMQTWgxd7DhH+j5W3hyVIgPpYYweyqSgvMTwJpxkCEUzwWX4doPGoTA8UqHVQR372TEZcm5rQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxa8SGBvBByGWnKT7CyLD+qXw+GsShPosxYuaoQIrRLRNitOFFC
	lqcMSV0Z5H8X5TyE/Ye5hZcXfk07SZdWucHqbAc8xis1RhtoUvfrT3fz
X-Gm-Gg: ASbGncvoLpTHCH14manfcOi3nJTYJFuGMGm/Gfs81JXX9dolFAQiQrTqitzijlI1yQB
	wcHe2L6bSbTjhItiYFqFgTmaq1L+vCymYJH/LnAs5sLSflbEnohnL9yHk9C2/rF3R1ZSZKarYos
	cNgrF7XXibnt7dT8HMY6PR+rX1Wy88DIvOYcAzwdLpApAnPDwhVxdPgNbVWNAQBsYm53dpZr9MH
	Qgo7+hMCMmbLSsnKYaoNYQUM2sg22j4CJhFck1CvyyrJHt9Ba1cdpg/3qcEq6fACZVeUaWXz4Ga
	J18Ff4d/sIgENUiX4kP+rD25Q6WHIflfFocmOekaK1xCK381RRd/+YgDME2Dx/ik
X-Google-Smtp-Source: AGHT+IGvcJGDwbjtlXjqFLefX5L1sH0BT9VOf0rQy4wUjlg1RcI3m5TY0jePBST/a4GfE5jBrdlXhA==
X-Received: by 2002:a05:6000:2313:b0:3a3:7638:d754 with SMTP id ffacd0b85a97d-3a4fe17ba86mr2479780f8f.21.1748726201915;
        Sat, 31 May 2025 14:16:41 -0700 (PDT)
Received: from debian.local ([2a0a:ef40:eaf:3101:2d68:caee:7294:3fe1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f009fb0bsm9030648f8f.87.2025.05.31.14.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 May 2025 14:16:41 -0700 (PDT)
Date: Sat, 31 May 2025 22:16:39 +0100
From: Chris Bainbridge <chris.bainbridge@gmail.com>
To: "Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"kvalo@kernel.org" <kvalo@kernel.org>,
	"Berg, Johannes" <johannes.berg@intel.com>,
	"benjamin@sipsolutions.net" <benjamin@sipsolutions.net>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] iwlwifi: suspend failure, bisected
Message-ID: <aDtxt9fInIypgPsI@debian.local>
References: <aDsNn70jcX6sDLLT@debian.local>
 <DM3PPF63A6024A9CDCDCB068431DD5249FBA360A@DM3PPF63A6024A9.namprd11.prod.outlook.com>
 <aDtc_1OIwh0DH4Kw@debian.local>
 <DM3PPF63A6024A9ECC64ACBA27CCABBAB0FA360A@DM3PPF63A6024A9.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM3PPF63A6024A9ECC64ACBA27CCABBAB0FA360A@DM3PPF63A6024A9.namprd11.prod.outlook.com>

On Sat, May 31, 2025 at 08:07:31PM +0000, Korenblit, Miriam Rachel wrote:
> > 
> > It doesn't look like it made a difference:
> It actually did, that's a different assert 😊
> 
> Please try the new version of the patch.
> 

Fix looks good to me, tested on two laptops and the errors are gone.
Thank you for the quick response.
