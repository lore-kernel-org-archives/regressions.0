Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409A430E85B
	for <regressions@lists.linux.dev>; Sat, 13 Dec 2025 23:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765670050; cv=none; b=IioBbskgOUrDPvDmOrS8e2Id/bup5e0KUM46iiydut+fQXS7ApXRL0UIaZVKeooj2k/heyz99DpJeGIvGW6XC0E7K9dgEkY4sAso9OFTd1Ah6Em3sDGl91BeXwqKgHDtScR5qoOnszjAP8Jw10sgjVoEXf5OZO+U5kuN3piU6Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765670050; c=relaxed/simple;
	bh=dMvsk4TMnTyWR5/Ns04LifXAo7hjvc9/eJzEhni+uvA=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=VUaeYZtnsdLpgbuCIfXA/Uz5js4OnIFX236kBwSGv127CTjIXfmJEVXO5vfFZPWqZckvKj1XPPwGXyy4wtMYIsQs62bq10VCCgKQeS8077ZGAgn3LStPR71kHf7AyPtFOMxiEBX4I7aSt9AEPkcUYoFym4qZhgHcE79pP9JEQ0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lB1rhmvA; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lB1rhmvA"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c0ec27cad8cso1198604a12.1
        for <regressions@lists.linux.dev>; Sat, 13 Dec 2025 15:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765670047; x=1766274847; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XYN/3SFl60V2M0Q1BmnbULjYHcf9XcZ8oKvOquVNi9o=;
        b=lB1rhmvA6KUqgJmId7KOtzu50UDt2NS4QnI1bW8pSjB4KWflFgc110VLz+IgKBrrRL
         6VheZh81924nsnsBZhXoZzm56Dk7Jn70B5oqHMfZD2vnqgWUwijYMoCjwvtM+O67twZU
         w8l13oQXOHwwab8hZvdSwzvAtXZ1KWN9awtNArVuy/cdYGhZgAyjXDUyk6AfgeKl0AXt
         Z1W+be2Y4n6T0b5VoPcPPYvNe2YQnPzBP4tsCk49ukkj5jvS7BW1tI0+BVWTlV+9nsGX
         pib9MT1x94fyyYTI1WQ9DVaaktRDrqDNbi178hcDz3WcXBi58t3yeN53XotrBYOdx1MB
         pEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765670047; x=1766274847;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XYN/3SFl60V2M0Q1BmnbULjYHcf9XcZ8oKvOquVNi9o=;
        b=nN442vaz32IYnxqFa15fvpefrJLfeNBzdbW0c9vZx3CrsTnJ1lXB54pP9kgT12mhKW
         8sIJ8GDvLzBW1BZqomMvl1xPYmfWztw0wriUb0Ly6ywnr6pbaA/JVqy/TAyyUVOqY+25
         oeZjpnAUtVFss1nQGHlK7tw+N09XzeMjoVtZfBEMv4JocJ+nnUsvOvK8V0yPp0HnHiXC
         4WZFcZ5EGlTu+OHn/LSq1XinKHlPu2/OazZzIIZOs8OcSQ+r1VOrX4XT3DbCPNkQjV0k
         W2PuqjEqGzt813+fkdrNIym3KgsS6jx9yrBaRJ/BxqON9n8jEbU4WSngt2UQQ2Kb6INx
         Q7qA==
X-Forwarded-Encrypted: i=1; AJvYcCX8PkiP2JEILyorFpNjJs52KcL1+3iUMPZnS0jqBkxSQbnj5Eo6n43+43gU2UqN2XzV7HiYX17sXL/QWg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxInf9NC5cbnBMaq6ck74AwIrZuWZC8xaSnp39+K67ucWjH3tUZ
	FujRyJ4ZrT7YaN41FdYjUCtS4cWq5y1tvlZ/AQyXF/4jrR6HSrC/BSfC
X-Gm-Gg: AY/fxX6oVqivKyMMAJ3HdhBiUX5mIAVAG1kndcB0cgJ9IBKp3szC4RwDjHEIZyxnkNp
	4OebxOyxvPkj142ED4QkSo5jJ/XVKDuAbS8Iy2nfkUrnoPepN1qqNOe7NHnuiIrSqlnu0jxKb6C
	mBd+gb6yN1CA63ikvk2/1e1F5ZliUFZS1q07elnP8WNbw6WrdcFRrVHt+SLW92djvXxKlsI+Urp
	dPHll6OgkPf6ye6kJGH+bjU9kyn1TCEh/u/+FyjJV08kzOmsMRqRxRAhZpCELojKvPm5BlCupC8
	XR/ve0IvXxt+fRm3xhlaCM2EwInz+LKXa1EDnsHYQDsvUnOMsmuBKP/4xCb7dFWOiSHQdvnX2VO
	arxmC6MzsfKl5vqOWd4PRad21oMdCIhk5jaItpSKx8nGOHQfwT6VHLWM2y9YrKuBrJ3MuAZvnNh
	4q2evrLYVnVnFi+ArEvVDLEIaotV+jpHSiSOBc03tgz3WY5pA0S3zPnamBOERw48v/5w==
X-Google-Smtp-Source: AGHT+IGDoWXmCM9OrPKNNZApGm50I1zqnlGU64Afsrvgz02JemgL7gneo2W2ox30974U77jX1cNJlw==
X-Received: by 2002:a05:7022:ea49:b0:119:e56b:98b0 with SMTP id a92af1059eb24-11f34c02b7dmr3531294c88.23.1765670047330;
        Sat, 13 Dec 2025 15:54:07 -0800 (PST)
Received: from [192.168.68.65] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2b4867sm31845185c88.6.2025.12.13.15.54.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Dec 2025 15:54:07 -0800 (PST)
Message-ID: <1286af8e-f908-45db-af7c-d9c5d592abfd@gmail.com>
Date: Sat, 13 Dec 2025 15:54:05 -0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: stable@vger.kernel.org, regressions@lists.linux.dev,
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>
Cc: =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>
From: Rudraksha Gupta <guptarud@gmail.com>
Subject: ARMv7 Linux + Rust doesn't boot when compiling with only LLVM=1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello all,


I have the following problem: 
https://gitlab.postmarketos.org/postmarketOS/pmbootstrap/-/issues/2635


In short, what is happening is the following:


- The kernel boots and outputs via UART when I build the kernel with the 
following:

make LLVM=1 ARCH="$arm" CC="${CC:-gcc}"


- The kernel doesn't boot and there is no output via UART when I build 
the kernel with the following:

make LLVM=1 ARCH="$arm"


The only difference being: CC="${CC:-gcc}". Is this expected? I think 
this was present in the Linux kernel ever since Rust was enabled for 
ARMv7, and I never encountered it because postmarketOS was originally 
building the first way.


Thanks,

Rudraksha

