Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D88E1A83F5
	for <regressions@lists.linux.dev>; Mon, 28 Apr 2025 23:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745883485; cv=none; b=Eph9k6mRBqAM9wH+z7cqR9+uiZfXXDDxQaWIo7JmYbeCGhey2t7NPhzlK8qDJKKhwJpmzOaJyrQ47WXVqt74cPmiRcz/2ipdqCL9UkgOQvyg8AUAcgpYpY+fN5/segFrIodJgkawEv/422Vjh5cOctTg+2oUbqgbm8tf5ExnOMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745883485; c=relaxed/simple;
	bh=oQ3FbEePiwGWAsASS7Z4SAIJv7xHO9jREHRK/Aibiy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lf7FK5W22Xdx9RkTN72quGPU1yHvhFsqkC7MQLiGcL4IUQyrLEEPZVQv1ebmc/fP281bmiD0WRZiMKdr9tWP/NjiOeYg7oRI3wOMRTKeFMnVqGHJ/OgyiuTvuNj5TMoMb4Mdzu7mW+9+HrPobW6JenHmbEzRILsygY/Ccnl0LSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=giBpL3TZ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="giBpL3TZ"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22c33e5013aso64656535ad.0
        for <regressions@lists.linux.dev>; Mon, 28 Apr 2025 16:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745883483; x=1746488283; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dLf00+i5WXU9IavHUl6p2C33/ZAJdIRYZ+FKsvR9muY=;
        b=giBpL3TZsgIi91CxwNVb9m36Ye6PVPpe92aUY55kKYh4/kYxLlL1UCO7XdaoDueRnx
         Db/qrWhpD+JPGXs7ccHRg+beRrZ5dM1cC8Ok0YRKuI5iqmGzR1djH1ZHgunQSzKqEX5A
         UV8SVgkBzI7LyPoztPem1N/vjWRQTN6SbAMsY/hWoC48Qt6SAcu0llWUe4uJCDFd9d+u
         U0wylA6x8PDPeyCGj6Hf1rj07nTFwIMM7R7/M3s/o9oUSZDBg/lHfIJjeXnM4Ffm5Nr3
         RDHpYIWdUoyzY4uWR0p+y1l98JJ730q4CMq5zIBi3p2MQaL52eeZ0BJTl0aQ7xjgwgk9
         H/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745883483; x=1746488283;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dLf00+i5WXU9IavHUl6p2C33/ZAJdIRYZ+FKsvR9muY=;
        b=RSil9Qqk6Yj5HXRtQCeCxKUZIVCG5PezwcgDRwZtskFb9ZGc3udrneLaHXqaEAp3TZ
         mKX/asqn/gwjPVWWrbhsButy0gu2leMT61bDAn1Wg1N4cGJ9gKtzTMMLig5GfT4vrz6C
         jf77tCm2u8WUf1mvngImWJ+tsJDc+fEmaX9xXI3eqTNH5rl0vVqy+VoIJ7NK1nT36L1B
         4g2PYnnbbdU+z5zrHQsxFbh+fxmsLAQ/1DW9CAq/1WPAo1Q9iPwETxNlm4/n/u9Owh4r
         Mjk4o0BqCqmSOYjlKfT4t5e/VoSqzSFHnFmPd+lnTz8YBFSwZm3M5A+93PkkEkJFfN+6
         ZghA==
X-Forwarded-Encrypted: i=1; AJvYcCVyTLT6l3zxy6kgGMuLErK9CCwRIKxOytdi5d6iLCYiUtzkS90WzR+yQxob0LTN5VejnOaV+IaVu1/dQA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/WsKhse405qRQu+9D67Wcov2bndYWWQBG/k+qncHpqoAqp8a1
	5Wl/wkfQmTov79lEWOGp/kF6LxKDsT4+E1WBOXcsd1qFUGrVeF/a
X-Gm-Gg: ASbGncsugFY4n7KgOD60i1G23HmCdsKxkm3Lla926sGU/m+lZ6llI3nbAnfnIMiR2tZ
	5ayKmEOM0ZWffr53Hz3ZEQDtsHIiLRwcoST+Si+LHoLMG0j41yfH1LKVI7epWAI6a1OfEReHE41
	oNJAO4vPWUHYedxLL3QVZbRc5aJegk8PqATvpg9AMSYFSwM6ZXjVoNx/4vSszMckyg5i+RPUMq6
	8FCHTvJN/c6O3M7yIk086HaqnbmXL75uimhxdmSOX/W311gWmM5m9gT2D/jWxCerreNCAZMYq4+
	cTiot1hpkldAMDDrnm8jSav84A11ntzwcoKEkoVOds4Z
X-Google-Smtp-Source: AGHT+IGkMQz3emXbltwBn1k0bQRrPQBRYhRx9PCGAj8+J4ESGupWLyylRHbo8KPGmReOdBEw7WzX+Q==
X-Received: by 2002:a17:902:c453:b0:22d:e57a:2795 with SMTP id d9443c01a7336-22de57a2dc4mr22963185ad.47.1745883483560;
        Mon, 28 Apr 2025 16:38:03 -0700 (PDT)
Received: from localhost ([129.210.115.104])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d76dd2sm90073895ad.26.2025.04.28.16.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 16:38:02 -0700 (PDT)
Date: Mon, 28 Apr 2025 16:38:02 -0700
From: Cong Wang <xiyou.wangcong@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Holger =?iso-8859-1?Q?Hoffst=E4tte?= <holger@applied-asynchrony.com>,
	"Alan J. Wylie" <alan@wylie.me.uk>,
	Jamal Hadi Salim <jhs@mojatatu.com>, regressions@lists.linux.dev,
	Jiri Pirko <jiri@resnulli.us>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Octavian Purdila <tavip@google.com>,
	Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>,
	stable@vger.kernel.org
Subject: Re: [REGRESSION] 6.14.3 panic - kernel NULL pointer dereference in
 htb_dequeue
Message-ID: <aBARWmQi6/reosTF@pop-os.localdomain>
References: <20250421104019.7880108d@frodo.int.wylie.me.uk>
 <6fa68b02-cf82-aeca-56e6-e3b8565b22f4@applied-asynchrony.com>
 <20250421131000.6299a8e0@frodo.int.wylie.me.uk>
 <20250421200601.5b2e28de@frodo.int.wylie.me.uk>
 <89301960-1758-5b2e-6d91-81ef06843e14@applied-asynchrony.com>
 <20250421210927.50d6a355@frodo.int.wylie.me.uk>
 <20250422175145.1cb0bd98@frodo.int.wylie.me.uk>
 <4e2a6522-d455-f0ce-c77d-b430c3047d7c@applied-asynchrony.com>
 <2025042831-professor-crazy-ad07@gregkh>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025042831-professor-crazy-ad07@gregkh>

Hi Greg,

On Mon, Apr 28, 2025 at 01:45:14PM +0200, Greg KH wrote:
> 
> Can someone send me a patch series that does the right thing here?
> After reading this thread I'm confused as to what is needed to be done.
> 

I just sent out a fix for the regression reported here, so after it gets
merged, I will send you a list of commits (probably 2, since we don't
backport selftests) that need to go for -stable.

Sorry for the regression and confusion here.

Thanks!
