Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB1031063B
	for <regressions@lists.linux.dev>; Tue, 14 Oct 2025 12:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760444550; cv=none; b=u8yicTz0bJhUO1wD1rgbjxRxRDTi7Hzx6tz+hfxbCoGVOlSl2PsdJMa4BvJ9lqENYDezT9heP6UgqsRUSEeAfcR7KsOk1R5TlWwOi/WVteLArw37FQMmEgJx7e7ia/o9spJ4mcsidRMAIJz5KkAsef1krhELgzjA9bNnK3Fo6RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760444550; c=relaxed/simple;
	bh=Ad+Act/vyc65p5SZBMOE8fQZgfdis66PnpmCEaRCJyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ENHxAcA55B8RAk0Vd5jyWESB7tn4/EDiIg/c2GmymSghJ1XcM0S2KyoSqJiimQdhYY14ETVtONz5+Vf2xtm6/pAtDqkI/nVWqlk3jpr9koZUOd0WbYZ1YJimwDeB+DRr1uwa2JECvWOMCOVR0JbBtrcL0c7ycnK4myuTB/bcVhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HNJ/O1iS; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HNJ/O1iS"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-637e74e9104so1264800a12.1
        for <regressions@lists.linux.dev>; Tue, 14 Oct 2025 05:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760444547; x=1761049347; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ad+Act/vyc65p5SZBMOE8fQZgfdis66PnpmCEaRCJyk=;
        b=HNJ/O1iSsWwbm8KVtKMfqfnjYp4j7iIONpiaiD8amrl2AAi/0NgLnujcCtW609BbaX
         FZDTTD0P4hu3lZZevPIVZ1XN5ovU43b2BA0NU03RuTpTkT+7voz6Z715OzS3+S9nKonW
         I13RPaGmCJNZsOPh77F+0fFe3s6yV5jbF/U1USYkVsxMluLNnCj/AQ9/L18PMs3dHikx
         Gc1SnaRURqUZabQLvF8/cxfNpmJl/UmZXZF3TgIAyycBA5oLiaZnvKgIs4BlLjGWQ8Lc
         SqAsgFTfkVzLAAvTs7K4zUSmh2lTQWOL8Sds4/OAcu61IHRFLnr80H+pOICWCGbze0Qu
         rqbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760444547; x=1761049347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ad+Act/vyc65p5SZBMOE8fQZgfdis66PnpmCEaRCJyk=;
        b=N27ScWQN97r6CI0s9Oi929IdH02oBQdXjqB03hKkX/atrcy14LTMSnJbq0mZLBI03R
         /pCUxuFDReHMyEm6Bl4yQD5uoe8TlIHDN6ASysjrjFXIkTnTwi6jzJpKIslKiMNSo8KJ
         bMXwQiWzuyKfviqu34iNGFJhmBz3oS2FNgKaBeB8BsSdaWYG3utPp/DiRS1GL/TmSFKA
         zL8KUQadxXWenoWuAOK6DwKS9zmUKKM5PLNAq0uM0u8ycCi+q5dYau7wpFbUgLSIn3ft
         9H8TeofdcK6z7dIfXvnisOvi50yEje4pf5wNUWrRzeUJBW8PHkmlqhUY3AzE8zYlQRHC
         5Llg==
X-Forwarded-Encrypted: i=1; AJvYcCWlcW2RPPGHZaXX/YD8sBJPx+eFai565ZM8X4NPPnsOTt8F99GxU6UzFE+RTCrIdDqz05v2vWEOvIcBRw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzOKm+mJyL3r81SYEjNK1XBzLXaEjQ6WhF9Rsz1koMLwsIAgbWq
	Basy+x6ZPmbJKne4VOnuQRjGQ4VwLEVDk9xXYf1gJRgIBf0vbYTKq1yb
X-Gm-Gg: ASbGncudU+1mGWyH7bbhEJ7wLAn7vQ82xTc1WjMtNlPR0rqRxrFOzgFl+naGWMWxHC6
	dymMIrcZCBSqzzb8GiMxQ0hG2i7HteMLyY1Mqy/r7dS+65W7UeZihXYXyFsa5ZEU5CIQ1NcghmM
	AcbgNNJ6qfHfBvPvLmd/GGjrGxlhhw5XqqXbVDrkWIBcZaS7xWvtXJsqv6M8/bhGYjiwoP+1Hq/
	ZmE+3zl8hioCPcusp2UebNmeAsWmgVVizjVbsGLhFtTyGEkDbe5HMl9VelnJ8wF0ZavErCBLlXr
	DKbLDv9RjLtn/h7b0eOZ6alwa48dFOUn8aoqQPH1VTv5QEUAnq6KCgYTC9q1ugMm17A65qVuXz4
	3IYz9h/1RP2bBl4XCkd7NlhmHicslh88SxzZQMiUKDTyT0IxBi2v9kXrCccg04BNpDCr9dIjJfl
	aYI/aV3jnlNwkd2Vy8Bnq8QvT7hALUJOKRxn6dpvsKNF7KbkRqeD4=
X-Google-Smtp-Source: AGHT+IEj2JtS1ykV7+4SnCPxXcV5s4F2p8zZ4Ybts8U4kG/OqGnxgxiwp/Y8Fv2A2MsHbr+lECLEwQ==
X-Received: by 2002:a05:6402:d0e:b0:634:5381:530b with SMTP id 4fb4d7f45d1cf-639d5b8956cmr22376195a12.13.1760444547186;
        Tue, 14 Oct 2025 05:22:27 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a52b0f358sm10963835a12.10.2025.10.14.05.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 05:22:26 -0700 (PDT)
Date: Tue, 14 Oct 2025 14:22:25 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Anusha Srivatsa <asrivats@redhat.com>, 
	Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] drm/panel/panel-simple v6.17 WARNING regression
Message-ID: <tguubjlh7ta7rvaq5pzzksamnc2kxy6yunsk3jeiiqz55on4yo@outv5vc3b2vl>
References: <hlf4wdopapxnh4rekl5s3kvoi6egaga3lrjfbx6r223ar3txri@3ik53xw5idyh>
 <DDHZ5GO9MPF0.CGYTVBI74FOZ@bootlin.com>
 <kcunz2b2usmvadgrnnu65op5oi5ttblrc463twgxp5gqhnufav@eze53y23avel>
 <DDI0OEMAGBI3.2WFIP0O7M73LB@bootlin.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DDI0OEMAGBI3.2WFIP0O7M73LB@bootlin.com>

On Tue, Oct 14, 2025 at 01:43:21PM +0200, Luca Ceresoli wrote:
> Alright. Let me know whether the series I've sent fixes 0, 1 or both
> warnings.

Hi Luca,

Just replying to have the info in this thread as well, the series fixed
all warnings I saw, thanks!

Kind regards,
Ernest
