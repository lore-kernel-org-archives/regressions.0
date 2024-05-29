Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C49816DEDA
	for <regressions@lists.linux.dev>; Wed, 29 May 2024 05:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716960993; cv=none; b=IPstdSv7iWoeENnxCSKJCA7LB7GHXuk3HvVNBE/JxGGiqHBikYtMQIuQYom3qSeYRPfJW2rPdF/2sC0Os6MQ2oBR6ixC1LIkGMLGm8oY/qQ3o2Nq2FPf0K426ELDJSFowG0e0F2hau4SePjolcUsgRtwNM4M7cchGvjP5Zsr7Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716960993; c=relaxed/simple;
	bh=VUHfqIpMLEJ72GmREl9aWEN3lHURkr2tcN/5lyxXj3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W6lMDbIOF51HvOdXKbMroCGBp6lrspJ4RvGBJvTjNSbwmlUdlE83UrWixHfVkAONI8gjk14AWcVB3YAd/1oK4VfyOKLuh/nyIW1Kn4Brsq7+sHK0fFW1rK5F1djKS+yVFFQOYADz8W2/g/hDlh/qSgaF7k6OILoD4GQbM0MWa+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca; spf=none smtp.mailfrom=draconx.ca; dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b=aDQbEIva; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=draconx.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="aDQbEIva"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-48a398971c4so548896137.1
        for <regressions@lists.linux.dev>; Tue, 28 May 2024 22:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1716960989; x=1717565789; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=59clAH+TNnE9vZy/uwPV+00ESbhoosRii3QZ8IXAsEg=;
        b=aDQbEIvaH6cjnOMX4YAhQbEB9cB0oEo0i51eawTikwO1TnlSO4RO5QsyrY1/7+QlbU
         /mOE7dVgRokAzFZ8dZ2XampiongTJbfhjlu1uv/Q2/C61Yarz3M0/BC0Nz4y990cehC9
         9Saab7VAQe2iVXQzcbEJmhX/R1Zh5VECA/uR8iVQytUUOt+D5MpETuMaJMBnKyRcMFfY
         Uj0OZNQlxWVTj8CgFI+gNLdKHnxdeqvEJaHe0QTCbBBh5ScqN7xY6VTYWv8aRAJvAO4P
         ueU08tAVUGE2OcHglu1widzuENa1kDl2a/hjYcxyaJ38Kgwcz6xlvhTc5Xneesf73N19
         3KDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716960989; x=1717565789;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=59clAH+TNnE9vZy/uwPV+00ESbhoosRii3QZ8IXAsEg=;
        b=kGjh/cnRbkmKbhzmsDbN3qZhiZNFYM1k6Eald4p3TCcqGmJljgWX5d+pTlA6ujgYwe
         4FrO9hrXxwTzBnw1bCCv69WBB/m7dbYdGt0GnWN2jbLRP4EvCZAJFtClTFK1jG0HC7Td
         PZauJHjo3J47wnWKeFEneqUKqWCWjfelFXBt6NfErEEPppU8wBXx7sXCDwHiJTf1zSPJ
         cUKbaBm9n4k9Fw2yww0L3OpS6ZPx2HKZJyZM+VXlxe+2/iUVNFN5dWNeXLSzrR0UEExG
         SlKNHrzgrjBkciQ1C3hO4i/LvLgHIs6odG7c20B5fOo/nRPfb86Fg9LdKDHPoxgYuWUl
         xMdg==
X-Forwarded-Encrypted: i=1; AJvYcCVpw39ZBhwy3DvlM0CFscQogj0Aiqlm7C1gpEw4EaAMXBeZdeWJkPKlgcfP6lLHIhCBVqy+O0Zuyr74l6hYLSjvg4weMrpQSikU+Eo=
X-Gm-Message-State: AOJu0Yyb639kwPls3Udea/CvT4JvmV2wRy+iFj3uVrBIqFbIQwNjEl9v
	QPxLNid58EAXrpydditBwIVnd6NgzdZYm6xr1rq7RNPimI3zdMjToyGqH1oAC6I=
X-Google-Smtp-Source: AGHT+IHi50YnmP4eqwBGVkxawc7m2GRD+0vuBM3Zf7HgW/Qb5VxPMg8AAhRusXsXfa+eQRRLQTyW1w==
X-Received: by 2002:a67:f65a:0:b0:48a:3f49:7ccd with SMTP id ada2fe7eead31-48a3f497d0bmr12405967137.15.1716960989540;
        Tue, 28 May 2024 22:36:29 -0700 (PDT)
Received: from [192.168.0.50] (dhcp-24-53-241-2.cable.user.start.ca. [24.53.241.2])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43fb16b7a06sm50380661cf.8.2024.05.28.22.36.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 22:36:29 -0700 (PDT)
Message-ID: <d7412ef9-8e25-4f55-aac9-8ec479fb6775@draconx.ca>
Date: Wed, 29 May 2024 01:36:28 -0400
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PROBLEM: kbd busted in linux 6.10-rc1 (regression)
Content-Language: en-US
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-kernel@vger.kernel.org,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Alexey Gladkov <legion@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <ad4e561c-1d49-4f25-882c-7a36c6b1b5c0@draconx.ca>
 <20240529052543.GL2118490@ZenIV>
From: Nick Bowler <nbowler@draconx.ca>
In-Reply-To: <20240529052543.GL2118490@ZenIV>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-05-29 01:25, Al Viro wrote:
> On Wed, May 29, 2024 at 12:45:56AM -0400, Nick Bowler quoted:
> 
>>        All other headers use _IOC() macros to describe ioctls for a long time
>>        now. This header is stuck in the last century.
>>    
>>        Simply use the _IO() macro. No other changes.
> 
> ... are needed, since _IO() is arch-dependent; this is quite enough to fuck
> alpha and sparc over.  _IO(x,y) is (1<<29) + 256*x + y there; both ports
> got started with compat userland support, so _IO...() family there is
> modelled after OSF/1 and Solaris resp.
>
> kbd ioctls predate all of that.
> 
> Please, revert 8c467f330059 - commit in question breaks userland on alpha
> and on sparc for no reason whatsoever.  Might be worth adding a comment
> to those definitions at some point, but that can go on top of revert.

FWIW I see exactly the same problem with 6.10-rc1 on powerpc too.

> Folks, 0xXYZW is *not* an uncool way to spell _IO(0xXY,0xZW) - if there's
> any chance that those definitions are seen on all architectures, they
> should be left alone.

Thanks,
  Nick
