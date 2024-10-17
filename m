Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7921DE3B8
	for <regressions@lists.linux.dev>; Thu, 17 Oct 2024 14:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729176022; cv=none; b=o0041b8YZYQXkwyg21bvJDxGmhw9TFJaZey1ItzxLjTNr44mNB5Eci75/T79ErvSYLEQvZV3/Rf9Nm/cNQOiVapWrlqy1DFz5Qql5Vvw4QcIZkodnVF9NtMJ5JDajdke9gC7OSHGj0J9lnuXgOU/YnGsMDkLjHzO6hIPSGRhdf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729176022; c=relaxed/simple;
	bh=Ow7lMTiP6/qD6JhAKLFfdugsTWEDHyesPb0Umrt7cm4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GGN80WRP3osHfmIWDmbB8KPTeQSsa/r90qIKMRwAJM/O0lhcUt6yj+0SoAI1d0Wsb7kc34vLuGhY48hiudCzz02bypUYYjeElyaujTJgypHrTEkXhX7voj7fyLthbviE9jAmraNhTmbbnzlsgN6lzhuSH6+XgLbcvsLMsJwPEak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=lOY3Xl5E; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="lOY3Xl5E"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-71e4244fdc6so704789b3a.0
        for <regressions@lists.linux.dev>; Thu, 17 Oct 2024 07:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1729176019; x=1729780819; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U7NPX/sN9QKmJNg/bLGonITnuw2jnMDPIt8a9yGDiPA=;
        b=lOY3Xl5EI0mt8fDbWXtVoD9wbZUZsbl+7zIXC536+BxKV+9YEEg7D2KXmHO375vUHK
         iw55EO1ftYrv7Uac5AuxS8Y2Vzk3nLl62zpVS98bB7A5+tt+nZBF97jx4W7CWh6+IaE7
         uKsirZUar6EY7guGrAwHP+vtnpQEVzxtKeqdfDLgbID8PadjAiMs3517t+Z8PuGn4fwT
         oJK03pikB8LlXC0Q5hQ26Cv3HvYearuW9npWHDngFqmAPlrRJhPiizF/Up20+AIGmpUT
         H84ZYZ+EZO2pkPq+P74NaT4D3IzWneL6EQ6K6aDeMK6IBhrGmfA4WO7fooo+fkLtPRae
         qULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729176019; x=1729780819;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U7NPX/sN9QKmJNg/bLGonITnuw2jnMDPIt8a9yGDiPA=;
        b=sAeMBw4aqCtzTpoEqyML9JzB2rNmWLbZ807+lWktbkP0t8ULUuo59RmSCEMMkI5Qhu
         Ne3lWmhCi73hBnz7zJO5xXDAvDZNzfadBRvGeh6ERBc/5FmQGQfK4eQoWs+Uyh/xhvB/
         hNe7VXoCEughusyh9qFds/kwGFkoPUr7VTA5Peyv9XHV6Gb/8HEKc82BOX6TGR7KReJ1
         Xo3HhTOyyG4Xd6uQ0PG9DG1ncp/EOFF3eoUoSt7FQxTghvyOoPIAwhePmsM1GfLIw+gf
         T3gCA2Q12N8dJCL6uwUlO1V6/CXOhSAmiuUMQeDnevpSFo6XOuq2ggjGulOkcss1pv8i
         7HNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUa87KsaDeQNWfiz6MSTVwS5vF/1kHd6ncoe6gPB7I5msfguhhzoHL9D9fzKEwhKpvy0kYjUKMWZmDpJg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwXOdErYfokWNkIJKQbCWDmrF8TX+LldSI8uMUyYEXURCwDZBeo
	vFtDlMeX2f0SaqXsUyOzGZLx3pgjpw1Ugjcy5wgtmJHzIgAXs+V/wJAGcXdopBU=
X-Google-Smtp-Source: AGHT+IEDqGTla0q7wLxKsCMh5LMNeOR3elOwCYlRT/VX2aEuOxOFH0r0wU5YyHRM1NAnWfQ3zzl+fw==
X-Received: by 2002:a05:6a00:198a:b0:71e:21c:bf1b with SMTP id d2e1a72fcca58-71e4c17c0aemr29243211b3a.14.1729176019486;
        Thu, 17 Oct 2024 07:40:19 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e773eab96sm4951444b3a.94.2024.10.17.07.40.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 07:40:18 -0700 (PDT)
Message-ID: <a395a18b-3478-45dd-aabd-ccc9d0851318@kernel.dk>
Date: Thu, 17 Oct 2024 08:40:18 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: AMD zen microcode updates breaks boot
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <ad9638b4-0a4a-4cd0-9fcb-2690693da157@kernel.dk>
 <20241009091247.GCZwZJDwFETmN5pEGe@fat_crate.local>
 <77f16324-47e1-41e6-a9e9-2cb7cbc8d14d@kernel.dk>
 <20241010134613.GDZwfapaZ8AKp0n72C@fat_crate.local>
 <842a76fe-3d6a-4846-83da-bb113634b8bc@kernel.dk>
 <13fe104b-d83b-4d6d-a348-1103d402540d@kernel.dk>
 <20241017100257.GAZxDg0VqDAesee00m@fat_crate.local>
 <3400cf0b-85ca-4ec2-a8a0-c9d75889d573@kernel.dk>
 <20241017141314.GDZxEbenNT6XF4jIaA@fat_crate.local>
 <4d4bf52a-dd91-48ad-8949-198b2ffbc9da@kernel.dk>
 <20241017142707.GEZxEeu3YHvnEMmd32@fat_crate.local>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20241017142707.GEZxEeu3YHvnEMmd32@fat_crate.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/17/24 8:27 AM, Borislav Petkov wrote:
> On Thu, Oct 17, 2024 at 08:23:10AM -0600, Jens Axboe wrote:
>> Yep, it boots with that added on current -git WITH the microcode
>> package installed.
> 
> Ok, lemme go stare.
> 
> In the meantime, is it in some way possible to catch serial output from the
> box with my patch?
> 
> It should be dumping something to serial, a splat or so...

Maybe? There might be some way to do it through ilo. I'm not near the box
today, but I can take a look at that tomorrow most likely.

-- 
Jens Axboe

