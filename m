Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792716028;
	b=rzJLDZG23IEE4vWf8S8iaZZ3CXcRbAQ7Z1u9P7L0qT7tO5i7Zmmzo9KBXTdPZH+uRK8P
	 2dL2wEPGbcXY3zWGFIBEI51BJ1AQVhDkL0ZZ4SNTkLOV5JV2lEtrMz1KlGeR1untKW0T9
	 fEUppDigON1oCPjrDw9W9sjVVbR/Pa2yUfDBnGFgWjMR0UFh3SFoERLNW7wwObVnM3+uE
	 3RHzT3cZKiMqK7nBttRax8Gx8/wWqGbvfJoSduQ5ot0i9Efsl+7nbYCGCBSvsQVyqeQLX
	 TbsgQYcUo8tJyZptdJ6oBauLLiWWLH//s0FoJ5NAebnRYufGgsOohVR5BJmQQKzalqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792716028;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZTx9dOA+V3c9E2l48EAUDZlXgm5BgthbGaJoqzKG/Vw=;
	b=LKR6x6C6JUikyw7CnPspizl4T88IJwJY1nE7ZNiJJWgvOWX0+IQjD/WYs4FfrSBdDXo1
	 +uDIWsSHAS4+X5pbz/zM1hbqewyPqte0g1g7HFX39gG9UOyEsI580Q1desykGnJ8VX7SW
	 BNdUGTVPH+UhxoT8TugPrBZzvyxX0IDKJNQYtLaQ0w2I+/UlMB6VtXT27EQx8AsxBkzl9
	 15ETbj3w/NLYZlUaAtg8VkNQ7p6ELmm5Ncyw6C6Ao1PruwXz6l/rDPOX5+xArmeoOskJB
	 SjW5s/tcWYh8ouKlHBjw70LCU+cJfA8zqEEVtIJx9n31G61tuZxIKlM/tjezgb5IawQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RiRYRgJd;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EB5606A31A
	for <regressions@lists.linux.dev>; Fri, 23 Oct 2026 00:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60EB5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RiRYRgJd
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so398054a12.1
        for <regressions@lists.linux.dev>; Thu, 22 Oct 2026 17:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792716027; x=1793320827; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZTx9dOA+V3c9E2l48EAUDZlXgm5BgthbGaJoqzKG/Vw=;
        b=RiRYRgJdaoPCsynJ3CnhE4AcVUe7hwGp8gRHqrwnfDEVWRTp/IRm7/NKgJ8SwX/82R
         2GgNQ2mNsnAqFvttQ811TA2TD5zjvek5XRSvOqxXckP6a/Gl1UT3MP8tvTSwUJdiO80K
         Cqk6FycYDTU6pzOKu0Kl0+U7uLWV851Yvbsh0424qJEIRl5IXiWuTtW+t5ow/d1VAcoo
         /ATTh3KH/1xvyeS650tkT20EFR6dq0jRn4VTwG3qPASmErPbnRGu3JxaaH9CS3O9/NeP
         D7OVCr+wTtaybw6t69iRB3NQx0/ODEo3UuiJfJ1MdnBcMnPxyNaMYlxTI1PR++wygFJ4
         0ZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792716027; x=1793320827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZTx9dOA+V3c9E2l48EAUDZlXgm5BgthbGaJoqzKG/Vw=;
        b=nq9hE2YeRXymPWINW6lFmSRxpSCM/+DS9kPPSUA1TzsuHiEr/QFrGQNT2u9jyG6K9n
         mFeFQ6YQyNyrvSufAtHowAtXKRLz/HVAF/mkdhVkS6DLNaUEeR+PXFjBU+6bnx+nwU7f
         5QaXTFOoYImFzpnTYwWSqG1d2e4C0esTHnekek5baS40Q+XTzI8b2VaLp1mB+oqWvtyD
         s0pM5KYIEqlHot453Z2oatTULexL0oSDH77+SBPbkkA8WHeKYuxC1lMXvVHD8ghNpX5d
         zEmSd475wyCb+Li0ImplHBdHJcjilx8B01xwgdPTPq8w6SrzmqwFJElUvc4y8AX2b+cF
         wGtA==
X-Forwarded-Encrypted: i=1; AKwUvBw19KreONr6PCpcZjTTgMfPtHJ85DpW3K4IPDqVa131Rs7CpPgxnNKZszc1LKrE/j8C516ub5LoKLPW0w==@lists.linux.dev
X-Gm-Message-State: AFq9FYKaXPPYF+L8nbJEq6BXIMrpQ+yrdBasSvecmeEkq/pNDqrz99KE
	CU0YPvBXI4yNfovUMEOFR+3PUP7wZmej2mDrk2mU23aj9iDnPcLEBYog
X-Gm-Gg: AYBFou35GcVpfvvECJKZRjJT3XNqeM6HBXcfKKrG8ywtn1cZ29LFroxDNln96ogR7cS
	d3rwH6nsrUlMRcdklI2PYxQaEWjo9I4SSUTlqiUqLdMj+4+gmFdYUhGs4W0EvhFRLf8hfoizNRY
	JzfhmAEXezFTWCre5Z1VDgKaafCSGM38vF8CiMYopmby2cS+w6kqPbiAfY94PFAA7tbkgrahoJl
	bqu0HE3L8KGT1EP8W7s2K3IYRVxPU/kmDt1EyZ7SQMWEcMMCBM4r4hq+9S9tz7QsDap1idU0b9N
	SdQB7I/rE+/giRba0l1GOma4zu6N/CTpo8dF1XtDV7vjFL5bBSPgOZ7oM33zxbsf63ZagnUvDaG
	k+ZIfs3R+pfY/IdgP9/GrTm4WK5OjvQ6omB1OMIjdtd323fn7PUFWnwYukKDJGO10ocWtIgv3X4
	e9QptnL6gtRsV6y8W3Z8XI2BbSdr1zL+QqQLAO0t1ItAKTY01zqjT8vL+ERBNaAyIWpf7ZoD+Y7
	IUyziJH0Y0TOmXO6LPx6ImqKNW3gfXT25x64SOCnfYvLGjbKagaH9ckUdWLaZSLNrphgzwagoqO
	tEQ/WcFz1HgkYv72eBHbC2FVooZOws0oOc6Ribaj
X-Received: by 2002:a05:6402:e8d:b0:6b1:cea1:a011 with SMTP id 4fb4d7f45d1cf-6b432a94c76mr1525699a12.0.1792716026746;
        Thu, 22 Oct 2026 17:40:26 -0700 (PDT)
Received: from localhost.localdomain ([45.93.75.180])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b432c96badsm426013a12.14.2026.10.22.17.40.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 22 Oct 2026 17:40:25 -0700 (PDT)
From: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Tom Talpey <tom@talpey.com>,
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH] ksmbd: restore Kerberos logins with released ksmbd-tools
Date: Fri, 23 Oct 2026 02:40:23 +0200
Message-ID: <20261023004023.98453-1-mike.michalo@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261023003855.98316-1-mike.michalo@gmail.com>
References: <20261023003855.98316-1-mike.michalo@gmail.com>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sorry, this was re-sent by mistake. Please ignore it: the patch is
already in ksmbd-for-next as commit 0fec4c24e197.
