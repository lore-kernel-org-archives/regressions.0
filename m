Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793271130;
	b=dnKiDKfeOIgspHt2D8J5xjSh6zaa1ZEGqolUn1g6iZ2CFGfmzqrEq68DMhEnR1Zh2zto
	 BH+HwFzoliKuyhdn/Gc2fCC++9aKUymgl32KNrDKVX6BqYKIeinEWtAzmH8+bQIFxIxfM
	 srGKVQO5X1b7zAe5nmNDCOXW112jR7X5NcHQ1OL8cvUSoyhhF97F5eG7Lf6nHIYqTUK4p
	 r7HillSH/Bukqc/Zbzs5+W19loaDxdK03zVuGOHbVMRQ9fwbZB0PHmEsCTZyO9MvqJ0WJ
	 pKvupfu1M6tkKhBmOCjJMrUZDGvOTAIngxZe2D7z/VWOgHi63dDbKGcjANPRriIo7Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793271130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=YJGyVP59UIBEumPiJG+nyeTNgoOkuxJ2PfWkUy2HMTM=;
	b=KuToL/cFGroVU68xLjWg8UU7cPGhC5uDhBM+Me4qOFNWtHu3yHWlAjGJRMI/GyFBvqjW
	 TjsN4WV3BV6tGghsOJmV86M7GHQyOH9Hxc5QMPAjy1XpUT7UX7uN2JG1sx2YGyswTHICE
	 7RSK9/KgZKEbPCnGahSbh49j3eDPIOJo4arR9JOmnxUB57/r1fZyZvOcCpDgS6IJfTUZj
	 GqtgaqNIn7u0oLlw/rpngVKyeKPhDRg06UfKnfX8l0kMqD+0sMO+DeOKNR4WVWjh8kxHw
	 FpCPhigO2KAJiWCO+HVa26DBnkBSvNwousSZtQociCFOlwRFz9jdWc+FXFBDC8I0Lkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wHvZ2GXG;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E606606A339
	for <regressions@lists.linux.dev>; Thu, 29 Oct 2026 10:52:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E606606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wHvZ2GXG
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-14fc585291cso1762916c88.1
        for <regressions@lists.linux.dev>; Thu, 29 Oct 2026 03:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793271129; x=1793875929; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YJGyVP59UIBEumPiJG+nyeTNgoOkuxJ2PfWkUy2HMTM=;
        b=wHvZ2GXGJkJ3MfNKSK/Loadw7g37vvlk4QoBJKDKHp61aBQD8UyOheTmabtnGd/+h1
         eBaZI1uvjwCR/suIyQsdzW/XUuC/L2CIl/NtcL0UZH1qAg2kBhxDbAu/fIxtLmOvKDZD
         kUQJUwI5z37uw4189tj82R9t+iXHivudHXntDfVJN3jGT5yerm2a/UQvRVQl2Q7+DucC
         5A07D5z792ckwSviAy0CbX4vhBtvoj4wByjTMUdW8bMxJNVghjqL8QVr/Rfen45lkWje
         cEXQjnX58WW0a5QnVms5H9eEcTttKeGR1M3SnHK4PK4acAOkNJSyGneciSpk6gMAP057
         A5aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793271129; x=1793875929;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YJGyVP59UIBEumPiJG+nyeTNgoOkuxJ2PfWkUy2HMTM=;
        b=RdfInBfPeTp7k9eogMMoM9iSIvUkIqNVdZCS4w5EpUe3xmIq0ufIdU5QpxQFGwd9JJ
         FN/hrUeyaoL4m5yfAumFxLZusyOXNpiFN5Lew/Siao4hY0ZIte2eMTMTiW2lAyaksWfJ
         HjhH1f68o5qJPZapt8NgIMx6PO5uHeEcQAQB3/JP5VEB+taO5Uqh36zSilBGTxEDiAkI
         ka9B8IlDynWngWHjXr+lpB3QPq9KmtwB4MtYazQ/Y3gSrpXs3DB2c28SbJK/Nn1Fzidk
         +7BtSlJOWD68Gw4fOJxl5r/tyBrUyxgE8/WMsl6Ha2UAPxYowK79fWkr9i1yI0JfunxF
         pDOA==
X-Forwarded-Encrypted: i=1; AKwUvBw1e1cekGut4SKdUPLjSSmPlazJFpoKc+q02/qfVRRcK+cFJWb/EKxk6Z/V9N1E+gJyOpDUe7XduZB6XA==@lists.linux.dev
X-Gm-Message-State: AFq9FYKuAQJ7/uifzLqk/IMG5o/DH5m2ohfMYKG8bRrTjHRuSFeW8M8n
	nqLLpU52oULaJjfMcgsuTPv60vnoQS+ESjhqFX5rJYVW+KLA9PIYnQhn
X-Gm-Gg: AYBFou0ckziIcOVX5Fhos//6BbNnqtpPLF0L0JAoASAPMLQsChllX/3G66nJoqMd2b8
	4xG9WtH3XbhR+LYjK58II5bXkKzmuxOxllFNvrBFkTiFT/H2qcf315B6FndFKvDU6+3vsL3f5gX
	oBdSL321VUnO7Rlt6XUJDs9yffR1O8pUAdhWr80DasEsDsbV92KuKyXbCkecqS51QCaFJWfJ/DZ
	KJpT4h7Xc+JVYpG8qL8fuSH8DJ8Wf2cUtjSgCTdYTuiVF5SbKjjgi9DxCM9fCv+HhzKKmrLrwy9
	6lJY3hgQGSk31DSjmyC+or9ttGoA9JluFRcvuBHQB3vOX4yfT+1zZnNAm8QDnsrMJ1Xt0vnGAUJ
	6/ofQ/A/UaT4zH8wEI8gs9h2ZMhZd48FGa0HRSwYQzQ2KWnJZfIItKYq6b0kJN1R3fFXrp5+9FZ
	M0ulHYK1ogO/fKYpN0yk2htJd20Fct0BO8O56RGVeLeRK+wGQLAC511khfJ/IlQlhqobPEdHmr4
	cy7Z7ee5A9zCbh1atzt9HxMmDqebUDst5oVXM01LuyIUW4CnUU2fSwuVjCIb/GiV8jj+v4YQsEl
	jXmg4xVjq4aGNao59vKNCQrS4JSAzTFPdPzc0HdlUno75T2UPksjVrDFpuwPYxi5Jw==
X-Received: by 2002:a05:7022:622:b0:14f:8d59:edcc with SMTP id a92af1059eb24-1a6cd3a116cmr8983973c88.12.1793271129261;
        Thu, 29 Oct 2026 03:52:09 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75fdc1031sm14304398c88.19.2026.10.29.03.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:52:08 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: mani@kernel.org,
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
Subject: Re: [PATCH net v2] net: qrtr: announce local services again once our HELLO is sent
Date: Thu, 29 Oct 2026 19:52:04 +0900
Message-ID: <20261029105204.2577-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <179303637610.3134.6464335759134048296@kernel.org>
References: <20261022163116.1042-1-26rote@gmail.com> <179303637610.3134.6464335759134048296@kernel.org>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 26 Oct 2026 17:39:36 +0000, Sashiko AI review wrote:
> - [Medium] In net/qrtr/af_qrtr.c, qrtr_hello_work() replays the HELLO
>   once and never retries, so a failed replay is lost for good.

Agreed. In v3 qrtr_hello_work() reschedules itself when the allocation
or qrtr_local_enqueue() fails. Once hello_sent is set it skips our HELLO
and only retries the replay.

> - [Low] In net/qrtr/af_qrtr.c, the new HELLO replay in qrtr_hello_work()
>   is not serialized against qrtr_endpoint_unregister(), so the replayed…

Agreed. v3 queues the replay under ep_lock and only while node->ep is
set. qrtr_endpoint_unregister() clears node->ep under ep_lock before it
queues the BYE, so the replay either comes before the BYE or is not
sent.

https://lore.kernel.org/all/20261029105142.2503-1-26rote@gmail.com/

pw-bot: cr
