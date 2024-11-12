Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399F51A256C
	for <regressions@lists.linux.dev>; Tue, 12 Nov 2024 10:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731406598; cv=none; b=WXej+O2SE9EWd6Qv/jCAWozdk+lE3iKELGLQ8fQRDKtt4HqJJ8kpZRun/hv07ZK+Lu4WDwSeHqKnjqqY7ji21H8ghHO8OBjnsSzBXNFgofuUOJiSA2k1YnYQXae1Uv/CwHWeXFclZJ6e6OaTdU+xjmByE1T7kNNS6lBUBk81bBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731406598; c=relaxed/simple;
	bh=LzisKRHviYF0vvp/c8zppug4b2SgFPILXsFSlHn/F5k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gim6oyTl8hGMCwmz9lsEBg83Jyj5kSPIb966jscGCMz9HThr/nDP228oXSZerE/rFTutpwUNQdM6BjYEwUul4TqB2UH9Sgpyw+F+tVBF0hYJuyEwgJ0wHB/MbYjlRdWxUvuedlLLN8REeyQn7BhBc0QxwzJJYsizbxo0XJaJliA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N11GmqGM; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N11GmqGM"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539f72c8fc1so9102205e87.1
        for <regressions@lists.linux.dev>; Tue, 12 Nov 2024 02:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731406595; x=1732011395; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U1NpDWCmtCJKjjDe9qtdXdh1o50OglVlJ0jdBgteH/g=;
        b=N11GmqGMvWiGljYwLdZr/9ZoS2giO7p4y/F0F65wkkVMfESbwMbACRdTnQ4vQWPOBY
         sZfKzFhHQCuDFCleA/Dccsl1qK5LKcs4omEX6JeZ5T+cFBRgJ4XB8f6w29uVvcJltq27
         iuCD3aNF/CP0AGE6WHhtjQQXb166JnX8XQHRo1nKmvGjnNe0bRWiBt0w4N6yYtFb9JAI
         l+rw6txAP+7KzNLb1PXzrA64/sHgQ5XJRIEsMpdIZfrYeZeyo+cZ6N3uL35m1bldnyO/
         ACGlMxh2h1rRHI/5JIH4F+6FEwOtU2bl8K7HwTyYwihpHd09Qp4zGwGA+uchPtZcfPTA
         +t4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731406595; x=1732011395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U1NpDWCmtCJKjjDe9qtdXdh1o50OglVlJ0jdBgteH/g=;
        b=RU3M5iW2tORK4u885bG/2RQXsmha700rLAQcfmisXeCbzlUzttDwmu+9h/3pugUDEk
         WxYK1jlkHaZFUCEIFvxYTbnWM1rlOzQcVEEl6/pykKq7Ng91hinIzCByY1XLx9uYldzi
         h80yvkIMiBmbrkeLQYntWjmzQeXsxXBPQxJF2p7kmywXIRb2fpiWicXhwPVEUtztP1Xv
         erFWDwM6SlLdW/vQMSwsR1OzuPWL1HEeXu6tp5yLo20IFxI0yOTYZ1eJX5Qnk4j6EyVG
         IP/hV9vpIwYhQzH53OFuEmfKd1MLHbgZ34QQclBvb96LLjmsi4vrJGurHaH9YgpDc3At
         kSPw==
X-Forwarded-Encrypted: i=1; AJvYcCVz88Ug07V6cv94wXFixov8twDKCv4KrtaJXDA30j48ZXyRFutM+GEqpdfxjsZu6htL1mWU+pEKUI+DqA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzc86nkIIucv57CD4n+ovbSWRGS8PKAk5zAkBG2e1xAQjmtogET
	02KzV6FVutprwmQw7X7DTBar0fD06vPxkHqUfmYCFE47VgvFvLhj
X-Google-Smtp-Source: AGHT+IFCRJw0z+cYNAZlQo0jd5oeC+GiBzCBWTfW2oMPVVvpXsQQqy70GxhwP1K9tFJQ5hPnnK6b6A==
X-Received: by 2002:a05:6512:1195:b0:531:4c6d:b8ef with SMTP id 2adb3069b0e04-53d9a406fcbmr1101865e87.6.1731406594938;
        Tue, 12 Nov 2024 02:16:34 -0800 (PST)
Received: from foxbook (bff246.neoplus.adsl.tpnet.pl. [83.28.43.246])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826a9da8sm1808565e87.206.2024.11.12.02.16.32
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 12 Nov 2024 02:16:34 -0800 (PST)
Date: Tue, 12 Nov 2024 11:16:29 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, Catalin Marinas
 <catalin.marinas@arm.com>, Linux kernel regressions list
 <regressions@lists.linux.dev>, Kees Cook <kees@kernel.org>
Subject: Re: cacheflush completely broken, suspecting PAN+LPAE
Message-ID: <20241112111629.18a6e464@foxbook>
In-Reply-To: <20241112103229.566b1ff3@foxbook>
References: <20241111233817.2f824c19@foxbook>
	<CACRpkdYsgnBFsyF9upr=xoLdMJ25DCXMEJ-co7rJTnRanJncug@mail.gmail.com>
	<20241112103229.566b1ff3@foxbook>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Regarding test programs, I also wrote and tried this one yesterday.
It's based on a similar demo released by ARM, but much simplified.

It both triggers the bug and confirms the necessity of cacheflush in
JIT compilers on my CPU when it works normally (prints: 1, 1, 2).

On the buggy kernel, it usually segfaults on the first attempt to call
*code, but sometimes both __clear_cache() appear to take effect despite
the syscall returning EFAULT (according to strace), not sure why.


#include <stdio.h>
#include <string.h>
#include <sys/mman.h>

int f1() {
	return 1;
}

int f2() {
	return 2;
}

int main() {
	puts("start");
	char *code = mmap(NULL, 0x1000, PROT_READ | PROT_WRITE | PROT_EXEC,
			MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
	int x;

	memcpy(code, f1, 0x100);
	__builtin___clear_cache(code, code + 0x100);
	x = ((int(*)())code)();
	printf("%x\n", x);

	memcpy(code, f2, 0x100);
	x = ((int(*)())code)();
	printf("%x\n", x);

	__builtin___clear_cache(code, code + 0x100);
	x = ((int(*)())code)();
	printf("%x\n", x);
}
