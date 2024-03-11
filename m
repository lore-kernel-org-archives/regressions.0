Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2522255E43
	for <regressions@lists.linux.dev>; Mon, 11 Mar 2024 19:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710186433; cv=none; b=LOL6afTFFYCwRVid/s4bTkeY7M+Zp1+W0lG6ngMSjxDWxXurFPa5EH/RfiLDcwByXfkQt0eyFEFJnMNTEPhVVM8g9L0ij7UMZAjpzYZ8JQFwv+d+0Kaf6MooIV+aKOrErOiNsEUwvYz3DM2S5lI+v9SNzZkM+BoFfOHW+VQAgdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710186433; c=relaxed/simple;
	bh=eLIc0xr0B8aywYxOL8nWR6K5MxhqHA+NT/WZxAOcGjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cQhxBr2WjxFbzfMq5W/WwNEoxYuIX99SReTfBymp+cVLRgQ43RhavFmpACE6DSUoa2BXHDY63PgzB/JeZoDdGPCsk28fmGw4BJOqBj3sr80eLprSxHi0M5kCxa2j/u0Joe2z9VhoOt5MnBPzFC79z/pUWbAiyzBd6DxNqHllJFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IbXh2KmF; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IbXh2KmF"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1dd6412da28so24935305ad.3
        for <regressions@lists.linux.dev>; Mon, 11 Mar 2024 12:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710186431; x=1710791231; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lIRy1ixduPqe9Q6b7N2f4cWuGKlMEt2GHlY23wuR0Io=;
        b=IbXh2KmFM/yqXvQQSO15d1+ahCgNMlz4zf45ln5VuDofzN6NHKinMUljanzyFkH1LP
         txnt5sIj+ENGeZX/clwkv8X/KyIbxqiRg1oSaLQLgI/BgvVoCKWeSTli4/1riNdCfQMn
         ry1yKD531YIsiv8SZJ6FQxn2M1gVr957UIbAwv6F7LxdgsQ2Up994uWxIE0pLvrvKhMb
         JrqG8np3g4SYIkYfbYZl6PVwb1xKtMZsZshtFCBBCjsiYzGXyHewn1YnchKX5b8MzddN
         JcarfErQxX7QzNWmJ8RzPlfg2T5txDWCLfJB/WO0ROb+luKUHB2Ji/wQaIkGiMHDsnMG
         J4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710186431; x=1710791231;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lIRy1ixduPqe9Q6b7N2f4cWuGKlMEt2GHlY23wuR0Io=;
        b=FX0rWS7fT679Hs2FeVOQyVYMf5BgbwRcqAKe1g6tZSfWMf12Lv6eMt8Dux1qsXb7/k
         +mjUfz4ynnD/7CaBHUy0bAysgmdcPmSk+EGufAlhfaJRy1e96jjWFNz+MSpYQeY79axT
         e7/ariBelbW4+szCt01u7tA7F+B69oU2vXcnPvUy6tL38WHUhaKnZfWUkmwnVBcGUM8s
         lhJEG4D4ALzgqIehR6EJZDUqwTiLMeP7PTtqBtiIgEETHKnnoMTGQvHi4s8K0lzKXMbp
         68OQEtvnRZszb9+Jma2zwp2oCvbpSb3tqfrM369HWB+h1T7cZyuJPtX9zrbyW8wK31y7
         E1Nw==
X-Gm-Message-State: AOJu0YwzVSwNY/fp/q9CgbZ0Ndw1fICw2ISBBUz6U2sv1kP05COsAipT
	si2R2kxEN331Rt6sazBRKWkPLmDSsCMI1pCjFhU9jCszrCqGuHKdMsWxoh+D
X-Google-Smtp-Source: AGHT+IH8M+lkCHWFKFcqhZGon86ExpyilLQGhITBSR/GZFqADvzVHd8O6G3KSSKvg52UV9LCbhIU9g==
X-Received: by 2002:a17:902:ea0b:b0:1dd:38bc:e635 with SMTP id s11-20020a170902ea0b00b001dd38bce635mr1658172plg.4.1710186430927;
        Mon, 11 Mar 2024 12:47:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n3-20020a170903110300b001db8145a1a2sm5056705plh.274.2024.03.11.12.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 12:47:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 11 Mar 2024 12:47:08 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: regressions@lists.linux.dev
Cc: Chris Lindee <chris.lindee@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>, regressions@lists.linux.dev,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Ashok Raj <ashok.raj@intel.com>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [REGRESSION] x86/smpboot/64: System will not boot on v6.5,
 v6.7-rc4
Message-ID: <ecb11a0f-83a9-422b-9b24-8fd574656fe7@roeck-us.net>
References: <CA+2tU59853R49EaU_tyvOZuOTDdcU0RshGyydccp9R1NX9bEeQ@mail.gmail.com>
 <20231210110518.GAZXWbbn9+ZNF5kwQV@fat_crate.local>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231210110518.GAZXWbbn9+ZNF5kwQV@fat_crate.local>

On Sun, Dec 10, 2023 at 12:05:18PM +0100, Borislav Petkov wrote:
> On Sat, Dec 09, 2023 at 09:31:48PM -0600, Chris Lindee wrote:
> > My Dell-EMC PowerEdge T340 server worked with v6.4.15, but it will not
> > start with v6.5.x - it won't even display dmesg events during boot.  I
> > reproduced the issue on v6.7-rc4 and bisected the first problematic commit
> > to:
> > 
> > 0c7ffa32dbd6 x86/smpboot/64: Implement arch_cpuhp_init_parallel_bringup()
> > and enable it
> 
> I presume booting with "cpuhp.parallel=0" on the kernel cmdline fixes
> it?
> 
#regzbot fix: 69a7386c1ec2
