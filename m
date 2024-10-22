Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB2919ABD5
	for <regressions@lists.linux.dev>; Tue, 22 Oct 2024 13:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729602912; cv=none; b=tY6+iLgKZ3PMbsV0cJ4AAfqrp934I1/X7p62yZRBQZ9jswyS+Csd1uNjKX3GGY3jhTUebx8PvRUSjusKVnbV0lNpRcCdDXbRZpM6oIq/r91hng6spi0+rj3X7yVHAapdh8WZKDZEjxfmCZJb/vHhhkG2IbQk4VYAoAhILe7iht8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729602912; c=relaxed/simple;
	bh=UoQaQnrqQ1WBGYkIx4J+4jJE/uP24fHs+WeP81kBxno=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dE2GN5UYzz3+sMzVaF1vJ6UIYvCcrfl+cNaiLYn0nYLI/ZrRCy+xiacm9nYpJTWgxGugEM2L+PdyKJKGqXuHsHkxhdEkym7U7yEgN3Nd9+w6mdviydEA8vwh8W+rpY/NjJxV/3lvV/XjdJovAvOrie8FiAZKIm+X8Qo6LwqG/Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=rT0KJ8YJ; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="rT0KJ8YJ"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-82cd93a6617so211660939f.3
        for <regressions@lists.linux.dev>; Tue, 22 Oct 2024 06:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1729602909; x=1730207709; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7HhRXZP19mzBOGCReuq+qXXrPGxMcaiU0fTOUSrQSuQ=;
        b=rT0KJ8YJunta7Hlxuj0JoGhBS+EAHk3Erj/P/XP/hndXeydZ8DbjCpm3W79W4Y377k
         IESstfeTaCZR7ACURyy6PTHntLh0nWwoCyvCwxAEtW3Dyiw6g512AhxPxzNp4OYfIiCw
         kfObHAEYb835fCDw76/qrnNQjHlRHWd8waI8/+3aq7CVBWeY+cdSKagXz9mwmIeoYHlh
         zXYQKJ4f0CALVmAHXCkdSEeXhpw/i5GRQJ//HM+rOHSSjaEPyyCumCReDoAEpLYSKGoP
         k1ICqwLmysAJm3t6McQymJX8Sip+8izbRCCLJNmrk7qzpbQ9SUouzrqlwkNkVaBuDhni
         6VIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729602909; x=1730207709;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7HhRXZP19mzBOGCReuq+qXXrPGxMcaiU0fTOUSrQSuQ=;
        b=dmAe8Q0MXI8CU3kwshLuTBizFkpFll/6fp80pu0zijcnWxHY3WpwZYXkB6qzuCORVe
         pyV730os6U0sxtrg5UhB8YynMmBnJW+ushM9kQnCxqQLuIC/PE7rf822rDEQGR/Lg5Xj
         Z/LQw3Nka5rtxsgPs6LW0ErI5TXcICDhsbqvFYmbcSl3y1o1zPpozk8/WiUmal7UdEzw
         UOv6YY2a37/PFZ57Uv7LqaCXfYDN5A51Mw0cgA1FAhTTIvjP3W6fRNDvmQQFMe1tyzVP
         tvHar9sLEf2+Pms4+PcuCp6atqC0EOohxhvBpSZh0hJB76r11e0r135dtfuvpZyh9FDZ
         ZOPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNwPLbZwpjlPIiL3L2elh9sBe1qKUiAEmavuZz4NVoCQs9l891w8twAsqpKFbCSsCZhw0gnXCjqO2dHw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzqt1kQVNjFpynZpkaPdwT/Mtn2tw7Lh8cJxAfQh5Irpdzro7GG
	zG+JYu+8bohI3ZVAr9hymakAunbUHZ0UkViR8mm5R8sf8tb441l9fSgROTITM2tPscyVBuUdV4z
	m
X-Google-Smtp-Source: AGHT+IF6HTNE7SYoGoUTu6vg8Db2lhbasz38Avrn8hve9ZgM0WVlqHzOHZNeC9p/uHiiHNfqbn63zQ==
X-Received: by 2002:a05:6602:3c7:b0:82d:581:8860 with SMTP id ca18e2360f4ac-83aba64a748mr1550641339f.12.1729602909220;
        Tue, 22 Oct 2024 06:15:09 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4dc2a65c92bsm1561414173.158.2024.10.22.06.15.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 06:15:08 -0700 (PDT)
Message-ID: <eb6d8837-84cc-4b0b-8025-c846e24e8240@kernel.dk>
Date: Tue, 22 Oct 2024 07:15:07 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/microcode/AMD: Split load_microcode_amd()
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <1bb5dd7f-15b5-4d9d-97ef-75ebdc24e7d9@kernel.dk>
 <20241019093748.GAZxN97LS_dJ3DNrpd@fat_crate.local>
 <436b4fc7-6369-40d9-8e88-556cbf5a5687@kernel.dk>
 <20241019232138.GDZxQ_AtkqA9iAR2td@fat_crate.local>
 <b2fd70bb-9414-49e0-bdb8-5c538f247dea@kernel.dk>
 <20241020121819.GAZxT1CyR_5vLLZ5e6@fat_crate.local>
 <df217737-6e2c-41fe-b558-3e2ab6dc0d9e@kernel.dk>
 <20241021073140.GAZxYDXCk02lSrG3-T@fat_crate.local>
 <daa98312-cc66-4c2f-8e64-01358ee99305@kernel.dk>
 <20241022120531.GDZxeVC0WeUPhInkYh@fat_crate.local>
 <20241022120836.GFZxeVxGQ6vWIScFWo@fat_crate.local>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20241022120836.GFZxeVxGQ6vWIScFWo@fat_crate.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Tested 1+2 together only, but for those two:

Tested-by: Jens Axboe <axboe@kernel.dk>

Thanks Boris!

-- 
Jens Axboe
