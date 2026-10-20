Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502653;
	b=Zaw+SGQv7BPT39dqZ/i14kwDAFMAHlA4ybPn3iZQvCPqzpPTbnKFNL1JSzWuLIarpqBw
	 z2OFdRwxjbk5Eutd7/5NFr+vjzEbAcctqjBmi1MMSlpY8K27gt7kHe1iw9eUutLvIOuGo
	 MieFAIQvhqguacUKIsYNT5B9Y7gDsfMnAjLzCJVMK7qV433OZSqsQRJloio/ETzQwYkNR
	 95zWz/4+Y8e2hGDSERsu04FjF4f8HfH4IiohdWSTNfKyo1jYYVwgbOxAvgOlhn2zxvWLZ
	 HIGFFitHvD94KbroElDdoB8bHXbSfWU2UlyKg7XqBl+dgjNFnqpqOjMEGbbyJD5zkWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502653;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XRtR/3LEKCT96Cn332o020ioqbbOJSAYNYdI1pf8JNI=;
	b=pkHVJBO3rrKCiJljHH4Tlf5hgH6WyDImiH1whcnVdmLGDiy+kqEPYo8lWXehg8+jUZFo
	 wpH4wGbFluyPGcuYIFxfIqsTU3FNZMdQ7kLNBg7yimMRKwZ8uZnS3d9Df9/GohO86smD4
	 JwbepN+rtTGK3vDfVjgpy1pCe05eq8W0vXA8bO/HoW2w5pQn0V6jkFzpdBizoBp9rcNEl
	 w3LOcIxrQgPMDZL3b3cQrr1pKsa9y/M447BgKTI43sLzAKs3kt6q0RXbdubr/2fmHnXUh
	 O3HlC9eMu0YQ4wb063C1uJNvyXMelPh1larePOph6BORjBGGQh2Da8xTqQ6u+9FUmvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J8axx5B3;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CFD606A31F
	for <regressions@lists.linux.dev>; Tue, 20 Oct 2026 13:24:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93CFD606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J8axx5B3
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3a706146559so2409681a91.2
        for <regressions@lists.linux.dev>; Tue, 20 Oct 2026 06:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792502653; x=1793107453; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XRtR/3LEKCT96Cn332o020ioqbbOJSAYNYdI1pf8JNI=;
        b=J8axx5B3MvdMxUM5MZy6eC8VDx94E1J/Xic9Ku+sELh7Hj1qRaGAo9F+/QdYFU4TOw
         MbhFVnAcHNwXgQLmZCNmfXNtaNr6xRjG8Bfxjqi554KLx44gMPD5+TiI0g8vVWhq7KQs
         lA+UUiCvxhizsE8/NB6lgvK5Z3sqwmY8qAQd6nkU+PhHcQAcxaBykeqncW1XEi3ZNbUm
         l8R2bJHG1SA8GmUfkivl1yBqyisRnFv0cozNBNYjffcvt/RFLBdhENN9voJO+H7LlKWv
         doAC04MDFoLqCiDyco3YxvcLrXBzIweHH5Sx+EEHx4h/jZr4eC/CJp8fldd8I9iCBLEy
         sPag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792502653; x=1793107453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XRtR/3LEKCT96Cn332o020ioqbbOJSAYNYdI1pf8JNI=;
        b=lmXg2TMvK73zSR1xuCaCK+81KgGJFk6Q6RawG5nnfXSwxUYEG8BtGdET5BQE1cFDzo
         qB+gqzgR5tDWWGauYa92dPvMVAp8YQMz4hxc8YGPQfuhV6fM066FYE9Gas/7p+Peh9dX
         294iSDoxfh79Bcu9OpbeZZ0hUozyeoujYewfcJtJ4BTl4znzAIOT11BPZA5hV6QIeQqi
         88kSAQVXR7bNKZKwHKkDyqqEVRvypqfiKFGlap1BPFSE4NlTxCQOqpPd6S/ii731dWWl
         9Dn6AzrAI5VuTrT4RAXSIGrpJIxoYk441kTqsUgE9w10R4BWnbsHReLJ2lQBXVai5MEj
         hd4A==
X-Forwarded-Encrypted: i=1; AKwUvBxrT+ydFIs8RMemAJatmnMQjoMlktvK7BY+1Il7JtEzjOARyR7Ro7lfub96EQEm2grSqjUzMQBgvWWYGQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYJ5Gi9YpGA0SvfYgA57TXir7J8+M9DSLWz5++py1x5gU3vivkbL
	NUGXoNHRPXHn+zXxUbF0AhVXf4D8358R/C8PUKOafz6bRVYr55Zy2n/I
X-Gm-Gg: AYBFou02Oz+TAv+NCyhl0R7Pacendp3u6/G1Bo8WEhJ4aYHitiiej5+mLXq38pHOfPU
	3a1IhkFUPukQ/fzoDsfZF9UpP20QWBoSSkCq7jTG9+8i8XnMnY2dcps/eCCo2MefKUo0e4mQYVf
	kGZuW5KdgwBhQW+LvbpmrT1aPTqBGYZjjR3VCjZstm+zVpja8Ea1lsE4W12GwavvUtJnhB+wgas
	uFeml0K674VSlWmU1k/F1RNCHIw8o8Jj6QDqJtKoLz73IP/aeeb1xVnloOw3u0eooewFJA4Ez7r
	V5PaRoq3bmKdEcohFnz40+uPYzAJkxxVUI82h3QnAJ3plAZ1OsQqyQWlknUywGk960tAazegsU2
	56yUHNv7B3CFEtk7eQOddqfk0EUgFRJuJM2XYiCtxv1vd1e3m0b5pw+2yEvXlVe954h1nS3lal9
	GlkF4doeAA9cS4tGKPgOFhqE+8QHn0NA0q6kQvMPLKSpHKd1IcNzvIefNixhuYfnlEs/B//kJj5
	Kx3GMep4BuT/U8=
X-Received: by 2002:a17:90b:4fc2:b0:3ab:f2a9:cacd with SMTP id 98e67ed59e1d1-3acef5700abmr10872896a91.49.1792502652945;
        Tue, 20 Oct 2026 06:24:12 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad60be992dsm3550434a91.2.2026.10.20.06.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:24:12 -0700 (PDT)
From: joonhoekim <26rote@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Joonhoe Kim <26rote@gmail.com>,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	christopher.lew@oss.qualcomm.com,
	deepak.singh@oss.qualcomm.com,
	pranav.phansalkar@oss.qualcomm.com,
	andersson@kernel.org,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH net] net: qrtr: ns: retry service announcements on -EAGAIN
Date: Tue, 20 Oct 2026 22:23:58 +0900
Message-ID: <20261020132407.968-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <atLkH_D2JrYdzacx@debian>
References: <20261016124600.31-1-26rote@gmail.com> <atLkH_D2JrYdzacx@debian>
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

From: Joonhoe Kim <26rote@gmail.com>

On Sat, Oct 17, 2026 at 09:24:38AM +0530, Manivannan Sadhasivam wrote:
> This loop is going to block other nodes. announce_servers() is called from
> ordered workqueue which only executes atmost one work item at any point of time.
> So if any other node queues command while this loop is running, it will get
> blocked.

Right, the loop holds the ordered workqueue for up to 10 s.

For v2 I'll drop the loop and retry from a delayed work on
qrtr_ns.workqueue, requeued every 100 ms while the announcement still
gets -EAGAIN. I'm thinking of keeping a time limit like the 10 s in
v1 and cancelling the retry when the node says BYE, but the details
may change once I test it with rmtfs started before the modem. I'll
post it as a new thread.

Thanks,
Joonhoe Kim
