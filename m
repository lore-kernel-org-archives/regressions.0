Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C8C321F5F
	for <regressions@lists.linux.dev>; Fri, 19 Jun 2026 09:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781859893; cv=none; b=jLX2Opw5kMKXO2c6i5m97oMs06wAy7aiimCqbJOGZCN1e1JBWc1AMkZnNS5gDPCKLEWqLZ4QyNb5JFi/DvjwrUrf8w7ShskFoc+7CPqWZYl6WFP5DvwzIuq0cBz+AomH/DWoWexW766uFn7PKUdKRYoV7Odm9ty4h/NjfRzYWxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781859893; c=relaxed/simple;
	bh=AQayZSv8LiFNtJUg7nXjei5rem8CAOvfpAdGfnzRXxY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hEBbv1dvU41ETI2WlhTVbHsx3aH0Nm1tjSBh5krqfOvhrI3Iw73i8yPQiJ/Os24FW4/nzIBQvXokWd2woiRNbfq7KWAZdtbGwx2ZGyUD6X91+5irOGmKAHy6w8VgMmYziQG64TJW4yiKIB9w3/M7UVokEcOd6BsmVWPxQzgk1aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rjvy5mRC; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rjvy5mRC"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490b64c8311so17205615e9.3
        for <regressions@lists.linux.dev>; Fri, 19 Jun 2026 02:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781859891; x=1782464691; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NvPeX4rm8LDSKuRTQPiG1oQWnoxsH14o+aTlQ6C2+v0=;
        b=rjvy5mRCtTnmDdNXibm2IbduXVjN3EMhqnJ9yPVr7LYa4855J1QZJnbtpUyeHK8WCb
         +aEnFgb2kwzy3lm7XmqUue79DO823QgJ0ONcJJChLezfCn1h7EBk/gm3Qx1TLWA+xJWy
         M2Qb5oehy6hI+BO64w7YunJFt6W4EZd1p0VRAs4Qn94CGRM4msIj8Vs9y3bNRtZj7IwW
         Lj/f67WuC/LcRwxhvGEG/iP6H4U4nUMv6TCAw002Th6d1hl7XNwRKSjAI7/sktCRCIlt
         rGVnNCyJeuJJwPfiY6XF7rhbHgAqXlYXFt+OoNHa5WFqeaHRHQXTxiJ0Ki50lBr6k4c/
         c41A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781859891; x=1782464691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NvPeX4rm8LDSKuRTQPiG1oQWnoxsH14o+aTlQ6C2+v0=;
        b=WSyqYRizV8x6QehFnPU+F3A3ZjUvSsTlEJ+D7Uc0G9t3SWWDD+ch6rpkdKou0c5NYm
         UrN7SPhTQ7c3q81U0uv3jiFfyMhn8eCAF2xZMvBjiLT7dCFXMzI0pBTaAT3VkERT4zOQ
         RO4/KGB16GUkW+E0dLRNFhZHF9VAwF1rRJMGdh3SGJvAMOVo4Do+4PzF/K2PaglCg1kA
         Jp4USEf0vL+Ii7hObDvfJ/mqcl+tqTyd6mhH3dvTMMcUZJCAIdf51/320bUD6h8oyzXp
         CPIzeMwQyaG9YM0FEESEMqYkUT34NIPSBM4BQmrXnd9E5/Mh2X4oGnuFsDyytUNG0Deu
         B1mw==
X-Forwarded-Encrypted: i=1; AFNElJ+GxIa/zvXvznDqN+NOYTDqGibAldaa6uM3ZgyQPSV14hQKZNsBclIOap6WuBXQNYf6oH+pcEp91u6HuA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyBzlakD5SVDCM7xZRR9aPFbz1W067iBL8OU6nNRbk318OxyleB
	whhNNT6YgBfPwu3IM/eHGjvtn+UbMtfdYF/mitWoW2eV1gzD/bSqV33R
X-Gm-Gg: AfdE7ckiKDLxIC5QBsKyZ0t6+I5WROLrZkU36y8SDNaQ19ShSVVrSrZaoCO0gntWbgd
	zmApoy+VVB3NtclhmVEbmorKdBtfVO4nnAvoXf5VDvPUeenKGhhjru1VplOAb5kkvLrrGczdYCm
	urcdQCIls7ti+oIMu+zSe6dw4SfPWOEUnkYbhApOQQxyjPpz+dCe1LjdIohIebyYkE9YOkGlhGl
	/alsqdjYZrujSUvpGsQJR8b5OjwS1B5Re1vizyjzeQ2ABlcVb/GdiEZ9GfPIyQDXa/YI9Ap1KKP
	EnBsGOEglZZi7O85gw/Q1jurnFBdGj5pV1RrY8GuSEigw6qlDERRt+y2eVrbwIroFEvsGMsgBPo
	aR8UFqX6AqD+1Nyy1hJm9ufc1xtopqhXS4NGCwGn9pH5cV6xgj90Lh2kBipBuSc99vpOGFCZzHL
	GZmyMepuX5uC6bufUn42Bd7g==
X-Received: by 2002:a05:600c:6c09:b0:490:b8d3:5dcc with SMTP id 5b1f17b1804b1-49240e5b499mr32202475e9.19.1781859890525;
        Fri, 19 Jun 2026 02:04:50 -0700 (PDT)
Received: from foxbook (bfg19.neoplus.adsl.tpnet.pl. [83.28.44.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fcd7027sm54074305e9.1.2026.06.19.02.04.49
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 19 Jun 2026 02:04:50 -0700 (PDT)
Date: Fri, 19 Jun 2026 11:04:45 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Amin Vakil <info@aminvakil.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
 linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>, Tao Xue <xuetao09@huawei.com>,
 regressions@lists.linux.dev
Subject: Re: [REGRESSION] usb: core: interrupt-IN wBytesPerInterval fixup
 (727d045d064b) breaks RTL8153 in Lenovo dock
Message-ID: <20260619110445.5ecf05fb.michal.pecio@gmail.com>
In-Reply-To: <4e45e34d-31d4-4117-9277-36799e63e6f8@aminvakil.com>
References: <cbdeb118-58c7-48a7-94a0-15e5cdb5879c@aminvakil.com>
	<35d2b455-382e-470e-acf4-1ab60770da90@leemhuis.info>
	<5036fee2-4d00-4ca0-aeed-400da64d7872@aminvakil.com>
	<573bbb08-0ba7-4f00-8996-819cc1d9cc48@aminvakil.com>
	<20260616183646.4798516b.michal.pecio@gmail.com>
	<8f862eb6-adfb-43a9-b4f5-8f9232333b51@aminvakil.com>
	<20260616232027.10ba0415.michal.pecio@gmail.com>
	<4e45e34d-31d4-4117-9277-36799e63e6f8@aminvakil.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 17 Jun 2026 21:19:37 +0330, Amin Vakil wrote:> 
> The problem is something with usbguard all the way :)
> 
> Disabling usbguard fixed the issue and it's now working on 7.1 
> correctly. Sorry for the noise.
> 
> The problem was a stale usbguard policy blocking the hub, updating 
> usbguard policy with new hash fixed that as well.

Well, OK, thanks for letting us know.

#regzbot invalid: configuration issue, not kernel bug
