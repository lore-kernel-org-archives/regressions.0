Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CE41946BB
	for <regressions@lists.linux.dev>; Wed, 10 Jul 2024 15:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720625830; cv=none; b=gnVYMknQ0UYQmjR/xNhPK4+v9mn3xfIr5hOagzJ6HsmGauAPAKhKoLRTYF0Y8SMD1V1EH95uvu9mMRcm9DOTqKxs2Fr5HQBFgiOSbfqvRbJ8easNvOtklsZPGIge2xhdLJiQmCn3a9E8Y68wPyuk6V4fbJ97h3VDg5vTlZYSYGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720625830; c=relaxed/simple;
	bh=x+o4kPbiFSGaMLLk+/3IeoS/mUq9fZMtsf7DYiEwpco=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=un2sGXx9Kdtm7irDFZF2bxriPYvFeHLbDvRA9USBCORs0SVG8Q6IVTXUx6BUCyI8E8VmKnVS4tt7+2uEJIkIbxLy3jSysvRR+WqRsQOnOfR3Q+mdjn33G8XXUMpMB/VoDsbzyUERFp3KIWbWUDZHrxhEB3M+1+R6y0ol3xg2+bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uAT5Ie4d; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uAT5Ie4d"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e0354459844so6496750276.3
        for <regressions@lists.linux.dev>; Wed, 10 Jul 2024 08:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720625827; x=1721230627; darn=lists.linux.dev;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Zc8nMT3AAU8QDxt/phKAKKjkSLDSDuDLlhBSXcN3vI=;
        b=uAT5Ie4dSmpl4ELkpuUpGeJuTFKo2pyfeycluIodC/p0LXf10dezucTv5vusYk4CQ5
         1khb3wMvbv7kerWQC2hm6fzuIt1SIh1lEqXux/ZdyOW75YBQI+VelhcqbFb7tzUSWtom
         tiRr/xL9j5/9RMbAI2dvWuqIkfFHkV74FN1RVuPtdZNcmM0/E5ztjGE6n5DQPU3SC2PT
         1njaR6+hYTlQBTr9dokHW/yF9Jksg7+N2oOMVyF2wfCFIDfCINurK8kkkf79aNBnE3R+
         OKBnz8eh81lWfSAPXMYpfETu4c66NHy7t6Sqb45KguXikGwjFF1YRG1q6Eb/f+NZixcL
         YtjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720625827; x=1721230627;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Zc8nMT3AAU8QDxt/phKAKKjkSLDSDuDLlhBSXcN3vI=;
        b=StgUYB9J5+0ukVyeRLHyalFSVmgI/sCg0taIglvjeakLGiW9Ksg6EGrSFtwcJK7V+T
         Ikj70hTWOnWhPu9RLP8sSX4K8bSM1CP53p0KSuNVjS/JS43gJ2TCYDQ0+xYx8MXg0qlZ
         UYg514SFsWLgJ62VBH+OR8aZMm7l+Uir0YKBw0dEZoFfFwY8K1wQSM7BiOOwQ9Ws5VBI
         PKcL3rxkd0eGLd7tA729zihWkxHi01qZLdLFgsA6o/OCTbTOsk/YRFomg2za9Hf2UdOn
         5JHfAai6qArP7bSbWtkqPX9T0/MuY5eOjh/csQfCYX5kDC6UHGylZiqXprCggAcJqUEp
         HP+g==
X-Forwarded-Encrypted: i=1; AJvYcCUgbvj3yeXpbHofU15dfxX17BdU+t9lK0xM9QWkWOBzL8WmltVvsZwEaJdH5oNrRkOIrp+uB+bFz948KeYQBenvKetEqVqvHrlc/9Y=
X-Gm-Message-State: AOJu0YxgYsMZ1xYKu0y/NJfZyYGiuLNFwHJlXAAVYKjkL7Fz3LOkZ3Th
	EC0rERQ4Ez5XuNkeQ06ZTpJwwJHQj+HIrpj7dvJaIa2FTNSBHBUQn3xCZzZDhQ==
X-Google-Smtp-Source: AGHT+IFHIo6fU+7NNSLyfzTcFAbf/t4vdnUEaBIfh5qv8+9oqH3J3Xkmyxjko8dPd+A7uoIPPYKtPA==
X-Received: by 2002:a25:7408:0:b0:e03:34ec:16b2 with SMTP id 3f1490d57ef6-e041b11d31amr6735103276.42.1720625826988;
        Wed, 10 Jul 2024 08:37:06 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e041a9a156fsm637366276.65.2024.07.10.08.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 08:37:06 -0700 (PDT)
Date: Wed, 10 Jul 2024 08:36:54 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
cc: Hugh Dickins <hughd@google.com>, Sagi Grimberg <sagi@grimberg.me>, 
    Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
    Eric Dumazet <edumazet@google.com>, 
    Thorsten Leemhuis <regressions@leemhuis.info>, regressions@lists.linux.dev, 
    netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] net: fix rc7's __skb_datagram_iter()
In-Reply-To: <51b9cb9c-cf7d-47b3-ab08-c9efbdb1b883@grimberg.me>
Message-ID: <66e53f14-bfca-6b1a-d9db-9b1c0786d07a@google.com>
References: <58ad4867-6178-54bd-7e49-e35875d012f9@google.com> <ae4e55df-6fe6-4cab-ac44-3ed10a63bfbe@grimberg.me> <fef352e8-b89a-da51-f8ce-04bc39ee6481@google.com> <51b9cb9c-cf7d-47b3-ab08-c9efbdb1b883@grimberg.me>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

X would not start in my old 32-bit partition (and the "n"-handling looks
just as wrong on 64-bit, but for whatever reason did not show up there):
"n" must be accumulated over all pages before it's added to "offset" and
compared with "copy", immediately after the skb_frag_foreach_page() loop.

Fixes: d2d30a376d9c ("net: allow skb_datagram_iter to be called from any context")
Signed-off-by: Hugh Dickins <hughd@google.com>
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
---
v3: added reviewed-by Sagi, try sending direct to Linus
v2: moved the "n = 0" down, per Sagi: no functional change.

 net/core/datagram.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/core/datagram.c b/net/core/datagram.c
index e9ba4c7b449d..e72dd78471a6 100644
--- a/net/core/datagram.c
+++ b/net/core/datagram.c
@@ -423,11 +423,12 @@ static int __skb_datagram_iter(const struct sk_buff *skb, int offset,
 			if (copy > len)
 				copy = len;
 
+			n = 0;
 			skb_frag_foreach_page(frag,
 					      skb_frag_off(frag) + offset - start,
 					      copy, p, p_off, p_len, copied) {
 				vaddr = kmap_local_page(p);
-				n = INDIRECT_CALL_1(cb, simple_copy_to_iter,
+				n += INDIRECT_CALL_1(cb, simple_copy_to_iter,
 					vaddr + p_off, p_len, data, to);
 				kunmap_local(vaddr);
 			}
-- 
2.35.3
