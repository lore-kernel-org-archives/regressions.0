Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341611;
	b=u9xLYmy/Y84TR0FOGYY7huat4Fag9sB1c2hgjjOhRtnyGKZoDNp8kvBgiGy22xqHgCcE
	 SQIE553zqN28jHok9Jjd//Qqf5VGsMfcuVH5NhbQsph4wd3OxrqiZux68gIZ6pLmeSG2q
	 rRKcrVoodYy2NfTIcoUr5RRxiTp8sjsd/yjpB/2OL/Yn1NVvWWZb3kuoAJ0/h80TsUiBU
	 p29z/9HkMOLIiFVsXewyPg5XT18SJNSou4B3NQ6Zdpo/8rUEEDK679w0XPE8VLBn7jXxU
	 ivw8MYBqxYRM2OPiWvpvpqkcJX4JDw16Z1gl2+qNJXdSDvY2VLGh5Gn6xDTLaInuYgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=pVK6TxzyHxuUe79AJFfPFL423XDc/Tfw9WR4ND7xr+E=;
	b=pKsSZ+P7H9wnmAHLRAh9p+XztSyZ78giJ3OnguWknVx46c+uBlnIBCmp4LMqWdWzruUa
	 aRTlIrKPhbuoZzucDIIXP3y79KhA+EO2l9dFBIDlodFlsqet2djrxnxRNuCwe6M2buKcj
	 AmjP9B9bVZcaVSbg4wpHXpqWsSpunPBfOHEX/dMTdFoGxoRbDIEBbMA49B4VxK0g47EMU
	 lEbr3BQTlhloFRZxLyve/ZsmGIMH6+RLqc9DYlKT7qTGyTikkGQzifAX5+ZurjhotBYfJ
	 vUVzjKoYKNtS99QzztBom27O4oJy1+gdGo64zNzhXV8/Hi8Q2sw36tSYCxvXWA1aCLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Z/e1BG9F";
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539D4606A31C
	for <regressions@lists.linux.dev>; Fri, 30 Oct 2026 06:26:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 539D4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z/e1BG9F
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8ab37e44643so2569727b3.0
        for <regressions@lists.linux.dev>; Thu, 29 Oct 2026 23:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793341610; x=1793946410; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pVK6TxzyHxuUe79AJFfPFL423XDc/Tfw9WR4ND7xr+E=;
        b=Z/e1BG9FcmM0tGe7QuH2x7AbRxJ5ZO6kSstketwKQhZWVqVh7j624K3JGFf8FVRnPF
         DV4p4nNjvQ+ZFwcafx8hcVsEo13dlvuPcVdQ68hdJ8d6u/mvGTfHoaXdVU1RsoSOymzC
         /nsBsVjnx0DAsASf/K4JNFufotOg9tFAI8sYEQhIW95Dz579+vsUVtOQrXrNokCaEwAl
         JDWr4Y0SeEJ3xaGXzge36bNKRXmseTcJvwFrYDBziGwzo7PUTVYvGZjmtTqsa8a7NESc
         gmewq50b9vABJrkgFZ+UzFJtKKqlx55FUEFP/ux1gsm/KS33ziU4gDWdW0vaYo7JITxb
         xZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793341610; x=1793946410;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pVK6TxzyHxuUe79AJFfPFL423XDc/Tfw9WR4ND7xr+E=;
        b=yaGDEtoajNA6nN3WeIe6Fo/YmaE/C5gG7Pj0WRvPXtqe8B5PC+w9fZ/txkkBWC+eyT
         9rfXucdhGAoouk9oE9DubX+pAon5J0XZjEBZB0PfZPQJx+loVCqrYioH3mUetsxS5l6k
         GaW6H6WO5fPlybX3i5OBEHbYOaXggz3MkuxWmSS0ChEfSjjhhCwQN5AhFZB8hFvKZAdD
         Mr4VTr1WWjyov9AXCm3OgKYDnkaqI/1Et7fpP8NqVXUT7nDqMbnf6c1+CIIQ+Lp7teud
         1Mli1K21aXQzihSlzTVfJwi8kfd7vsaHae9Uq00G1jUIAUz1HP6aHX+bx7PsyZAhGmQJ
         fJOA==
X-Forwarded-Encrypted: i=1; AKwUvBwHwyLZawkjTTvQ/U75ZY5dT1igEzdXjkT1siSf2bSMmllpauycCqBKPu1mHFpC8JQbudQ6/WTq+gtcvw==@lists.linux.dev
X-Gm-Message-State: AFq9FYLuu1LOA4ajBbrv4NHH7pmh2ZqG/mArhzacI5yOHNtXobd8jzSy
	0Q/GkP3z2TmZQKMZiQcOmoHQEAz/Dud5GG7aWXBSdLLiIos9MUUdVF+u
X-Gm-Gg: AYBFou2D3KKpDJ3mky6YGqfL7abh/A9dT6nH20BjFCIsaENkGl39AoNF9JFSPc51JzO
	YD+KIhy6gGpGCZ3hSXHeFiKfHkl0VN/SYs1/Kw4K8bPYHTTTO36xcgAsdKXx1kD7ieYrMkiGBHM
	0g5vptFFrG6kBmLlS7uDlfsp8uFz4pD1qXjzrEeihfH7Vpkk8Gwsn1Y29EtJ6jjxA88wTRqrQ8X
	kxfR8lwbyc+GB5RuJ7JyhYlu8wUhkWY6TAap/4AwxStY4vUWeppikrzQ1ymVGY9QpB00u5IU9Ho
	eyZGxlKUX6J5lIqNC/OpPialD9mZuAbP6b7RLRJf59qGeBlLntI1Z6UnnYkKFduPJOFvrDdcybh
	7C2YvNt0qzmsZ3p1j5VzubZNEDIF+xkUhxy28J1IIjBxD2kvs5hicU+wyDgRA8vbueMl4enpDRu
	faV8ryuFXYQ2t9JodTf0ZRtWOhTPmNgPZwUkBGel3aLLHtXVMJWIZTBlsjKp9dcbjeCZzEdGv8f
	rUUm8I3vSdsERoFvsls5GEZRLMDEM4zZPn5sXE5ISDMJGFy1flVdSgmoAzj5B0vlDHHmI3LB87i
	vEnzEdOnAdURY5jg3rrl9q+Ca6ypXYr1Mj41PtRm4Dk7Vopl+YBICI9mLtzgJvaY0N4x4fqqSGs
	6dUlwE1RC
X-Received: by 2002:a05:690c:6d84:b0:8b0:e385:ed99 with SMTP id 00721157ae682-8b2b66c78a5mr7452207b3.30.1793341609736;
        Thu, 29 Oct 2026 23:26:49 -0700 (PDT)
Received: from [192.168.68.58] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b716d420sm4625317b3.33.2026.10.29.23.26.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 23:26:48 -0700 (PDT)
Message-ID: <dcd98f40-387d-4a64-a39d-9d1c7296ec7a@gmail.com>
Date: Thu, 29 Oct 2026 23:26:46 -0700
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: chipidea: otg: fix fsm deadlock and B-device gadget
 registration
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Xu Yang <xu.yang_2@oss.nxp.com>, peter.chen@kernel.org,
 gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, jun.li@nxp.com,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20261015084140.61544-1-xu.yang_2@oss.nxp.com>
 <a4edbfec-7343-479b-8488-38bcc3f23ece@leemhuis.info>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <a4edbfec-7343-479b-8488-38bcc3f23ece@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Finally had time to test, and it works. Thanks!


Tested-by: Rudraksha Gupta <guptarud@gmail.com>

