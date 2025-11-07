Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBBB22A4EB
	for <regressions@lists.linux.dev>; Fri,  7 Nov 2025 03:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762484777; cv=none; b=i8Yt7S5zNIJQP963q8OaXGH/KlQ/sgo9Z5r3OSL/NTNd/wyMCZ2WVEAzvveGtWUN9tE8gyzZvC3h8DrI9b7SxuE1e3wvas+QuKknZfURGo+Kyx7XxCl70kyCLOnkOS63XsRwzN/o5vqsQYQKheL1sZMSNG1JtiRLyDc3wwiYfek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762484777; c=relaxed/simple;
	bh=SqF6cjAe5fIGfKljFwR84iVXlUipV5ARm6YRakF57pM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kQSL5ImdhcjrT1inkJTDXukg55qxTh0xo6QeBhewbbhDLiNjVi1pk45U2QKuIChSQbqoT5TwF1kTxGgMeEkhDYfDdHXFIYpqmha5DivicCJ4xaBKUHM/5mcUglCxJTgyXPNyc43xiAkt1kWqflHhO4FfPxoalDB0LTKKSDB7GJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca; spf=none smtp.mailfrom=draconx.ca; dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b=U3TbtmaO; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=draconx.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="U3TbtmaO"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-88033f09ffeso3491976d6.1
        for <regressions@lists.linux.dev>; Thu, 06 Nov 2025 19:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1762484775; x=1763089575; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E56miCz2ucyW7p5RTNikjLhgl4gC4pK61qcfT2Qpt0U=;
        b=U3TbtmaO3Lwi1ofhUFiGQKu5u7N+6lLUqFPI+WwawauFoGqSeo/0T18C4AmAMO5M0V
         yZzAjYFlbtI59ow5pwEhiuV5hN17d+jL81H/TiMyja0geJcwWKuTffFIa84/8x7ynqAp
         z6d1uVaOV+V/eEIcOBQ1Ob85AE5nh6mM5vCQT1qBZfgnrVga4XldeW1W8cVzG99Su/Fg
         BeQ4UZRyEkD8r/P+oG4fO7dzajHeuyr9czgMpQ6QvYsbw+rue9vsJdd4eF0a7L02IyRo
         J+B8GWWnnFuRek6Ogh/lN6orbBA/9zvNWUtGpgyIHqxenEKLDUTASZCZfKRbwHnHotG3
         qhhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762484775; x=1763089575;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E56miCz2ucyW7p5RTNikjLhgl4gC4pK61qcfT2Qpt0U=;
        b=VOYfBTqclrRKPQeKtH32pwXdooKMNjc3zxLvds8PdAzddv9Me3ntAHrynAYafTH/NA
         sU49uCzxJ8L9t4VsSfJNHWAQywftFVeyrh71MhfUBKSfqZm/uBMm5hYz8IQn/CMJfGji
         QaFYImXDheTHoKSj/uc4Ga3sBpzbxz+JejEngECXYP44QS+oiQegtx/iwNcX8C0sgeAe
         cQhfhBDt7ONDUcDroF26xVg+12vbrP04VDc3zkF58MAqcrzSdBgraEqJYIMmnswV6HKv
         yAut8I6kUuMfVtf5K46L7sXBGpVbBT95sBSjX6PNqGtChA6w0Hc6UYwijf/I2jzRpHGL
         gPtA==
X-Forwarded-Encrypted: i=1; AJvYcCU3NjXa2xsEC2FbmdRYK4tyAvSDs4lQR6YtlvzW78/HQQZ5sZzuLfyEj4HLdKDJFO9ScJRAWe/dPN2vyQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzkxlZDzUkcSeigH+J3WYxcSNnSOjPB6fyuOd47DcVsScFwSU85
	idWMtR6zYCfl9YOK3H5R69uU87CiLVP96eY7nmNLJruE6uSl0X8WhLc8hqelOmULbig=
X-Gm-Gg: ASbGncuylJpnQkmE/Zoru3SoRgvMMBVv6zuyX6Fi0c66G6moXHZuUyM8qWjFvmsXz5k
	TUvobO9xpUBfDWG2Oy32UHLE35ZONXrCd5FDwX3ktpmCzGdyzUM0GRq+3wBwsmAJgGCL+onD6Lh
	PGq8e/SVckbQeeIrJ4Z2S+8CIxaLLkyHCWm5IG+LeuSixu33533yAsXqtXI+W+kYyhNjKWid7+3
	F4PMNo1JnTuDL1vIjjPRqX/3BBcvNFN56d4IKpF/xuhLu0sB6D637QA7LqwdjbLyr3pr1VthbnQ
	92fxTMcVVNFDv0AR6o8Mf/1nRM+GEtkOX0Gz/NWeCE7uXt/msrYe8rjSrCXDBSSMbPySFSBU5dv
	g9yzhorG20p8CTwmxQ7fbQNAhgINSkS+BJr6GSNKcKOw9WvX0V+IWXGf7/8qUiVzbDcIUc2ELrC
	h/O0YfyJ7FAB9I46tE6X/hujX0F+GK3I1Oz1fk0ol2
X-Google-Smtp-Source: AGHT+IEwrtDh+N2RU8TdlIkL8MsNx2X7a1H9tD28kPSplx5JFVcsb0223J9Fj+vOzbjZ1jDImx6R0g==
X-Received: by 2002:a05:6214:4004:b0:87c:108f:676c with SMTP id 6a1803df08f44-88167b17ed2mr26261796d6.25.1762484774711;
        Thu, 06 Nov 2025 19:06:14 -0800 (PST)
Received: from localhost (ip-24-156-181-135.user.start.ca. [24.156.181.135])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-88082a38210sm30548476d6.55.2025.11.06.19.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 19:06:14 -0800 (PST)
Date: Thu, 6 Nov 2025 22:06:12 -0500
From: Nick Bowler <nbowler@draconx.ca>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Esben Haabendal <esben@geanix.com>, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev, linux-rtc@vger.kernel.org, stable@vger.kernel.org, 
	sparclinux@vger.kernel.org
Subject: Re: PROBLEM: hwclock busted w/ M48T59 RTC (regression)
Message-ID: <e7ezfmqnbduq7jdc7osicqp4rnztu466gpbcxaoj54jfigsvvp@iroscsnamy3c>
References: <krmiwpwogrvpehlqdrugb5glcmsu54qpw3mteonqeqymrvzz37@dzt7mes7qgxt>
 <DmLaDrfp-izPBqLjB9SAGPy3WVKOPNgg9FInsykhNO3WPEWgltKF5GoDknld3l5xoJxovduV8xn8ygSupvyIFOCCZl0Q0aTXwKT2XhPM1n8=@geanix.com>
 <ni6gdeax2itvzagwbqkw6oj5xsbx6vqsidop6cbj2oqneovjib@mrwzqakbla35>
 <35bd11bf-23fa-4ce9-96fb-d10ad6cd546e@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35bd11bf-23fa-4ce9-96fb-d10ad6cd546e@leemhuis.info>

On Thu, Nov 06, 2025 at 11:25:55AM +0100, Thorsten Leemhuis wrote:
> Just wondering: was this fixed in between? Just asking, as I noticed the
> culprit was backported to various stable/longterm series recently

I am not aware of any fix.  I just retested both 6.18-rc4 and 6.17.7 and
there is no change in behaviour.

Thanks,
  Nick
