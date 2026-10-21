Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792580347;
	b=4s/4c5wk9XsIVhjXslcJAI0UkSCptEEDGW6wgIHnUOG2Pe7q6eU9edWuIUX1jrQnMJ9G
	 geLjt3U4SZzRMeex4+zEkyBobgdpciRBKQw0uHaoUsI17yat9w1POtYNJBGT0+pxhR9EO
	 4FVJEifBlsl9bQ4+EejPC9l1MkDi9XOtgAqN+QHt3KNl4+qjaEZjNqr15DToGy97UywAl
	 yDl5DFCA+XKPQHidmvRKjshJS+qV2vYlSvUv8+xya7/gPZtw/D8BBrKNoxXdOeYTG4ciK
	 RNSnf1x9tvhbmo3jybPy/pVLel0kWErOCH41gWxdidicykAD7FrWgoTZ7/W2iv3LDGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792580347;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:To:Cc:Reply-To:
	 Date:Message-ID;
	bh=+6DqmLcffIJ4zXqo73wDStwtJ+XJU97CzviAZxX2Wys=;
	b=kOF9PX1HFV21FwIO7Y2s03Wv6VnhyXCyOMjU6eDt21bZAjEG27utbIPMzP9KpQ/7nPbL
	 O8Lbj4ZMXRPnfl/raCWW3nb7etJ1+z+I9eKWIE9F5IchTYDeXhEMHFdMsZc/PwLbDBvug
	 cqgnrMDgBE4HC8BR6HS3BRAFTmvBOd37BmIQnScXjHt04kOQ9x7DVka4YpjUaWRkk16fj
	 24rI9IR+0t3gG1OTM355ohvuz5glj6wWYxccqXRQ+MHJnxeb9yyGaIitRMm4pxPLDdZQp
	 RySww4ey9hox6BoIXwpVWlrVKajoqowcgliNEGXLSYeygme88eIUn+0snaDnDZX3z4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=QMHW7XMC;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B06606A31A
	for <regressions@lists.linux.dev>; Wed, 21 Oct 2026 10:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1B06606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=QMHW7XMC
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35943f55c06so891582eec.0
        for <regressions@lists.linux.dev>; Wed, 21 Oct 2026 03:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1792580346; x=1793185146; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+6DqmLcffIJ4zXqo73wDStwtJ+XJU97CzviAZxX2Wys=;
        b=QMHW7XMC0V2fsd/m1qP3JNGXfydNIDZeD/rdUkE115Z/N4uUJ/ovPNpDrZWo30TMUH
         hxm1KhWqsg/eHqfpMcVh95Fbaj1rS5pwDozImP2hfKx7eZQK7OqONrYJlkm0/iq8EaO7
         XEfCKlTCEeKada0mmo+gd1W64EryNlxG/hwNwtzjkZlCC+pea8mQi+6CT5joKZA/ZZko
         m0TUGneDfdj5+jqFzMrMppO12su8jMuf2vW1jouJcUUlOd3AhUvnmCS9BIpJ9zRwBZAn
         BWWfY3qYuCfG5GyY9kaEoksEPk5tm8cs7lT3pDTxGvwXK1tfs/65xfDTt0DZSgQD6nwm
         4tcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580346; x=1793185146;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+6DqmLcffIJ4zXqo73wDStwtJ+XJU97CzviAZxX2Wys=;
        b=Okp7vfu1sCEn9hNZIp9R7DVDIx1syYHIiCJX1Mp/LbeC0B8XPFMDUJHSzdGevINumh
         xP6gVlc7amiI0SQ2g+y6ATdBGBcRjvRc4d8nLePR1HpDXoGJvMcqNPQYlyBk3vrwPddu
         oXoNdMMXOUT4TThuiqNAp7/SeXvCn3swpSt3BAJyyZebb11pyk6qXmlgRzggaYJo3ISt
         iWL9Dg1tOfXN5A38Ac0Ht7XtVOuVhcYqgorMUKf6C8aJ3S5lKY61+a4NZ91Lb2zL4shw
         hRqSab3LhJg9aQxPDZbWCMcDL9hR0DX3slpy1tMKy3YX0ld5mEbU57PduJgt3Wlt20/7
         MrEA==
X-Gm-Message-State: AFq9FYIt3oRGeG/jNlEAZAo1DfWdcDksFmxWge4DGCzivzejbVUogcnM
	1TOhzlTHBSxXP4J66F2cZMTiLIrYpij+BQ0DPzB6AYOIAzwM7ssA9WCnXmEgpK+xC14=
X-Gm-Gg: AYBFou0KGvuE+I3h2LGhwPHdg2zIDqe8mRuCKjypoys814AluxqPPaJdzI9pjtZ7A6I
	ZddpiJYD42jOyf6W1DxAgF/EJoJE0tzyDdqc6EmikZNQOw17Act1xyoOpnqxI15B2zGKnBdSd8W
	R3TRTx0GCwJiXhTkqKduXNgq+3Xdhxx4ouc2q4L3cAEoftrejLrpvuK/tjVaBPENVP9sMC1dKlP
	RhxfEwtckuTaJSkCB8rel/C1kA6dKpSY9wE1x5UzpzqYgUd2lSGCQJueNNQK5p1pBpm4cGAbnQ2
	S8fW0PbsoAl1RVT7SAQaQ3pINbWS8fCTRzaOMRrveQLPG6QKGvqh9bJGEG9iJdthVKPkS1rMPE8
	xxXIWA7pTVj7AgzCK8FR4jxYO7qViqJV15EHjEhdvfbb9yqzyb+AjCIoLgqRUcmUC2WNGnxvJT9
	oNsXvEqtJavU8TXk+3migeNRhvSG8WlqmwPLvnuPo71eREATtZR5pHrU6z6jNqiPG9pw0sVN2Ec
	MNTCwrNZQJNtKF8yACVbxlu8E1/GppNT/Idd0xYgwJUa1Sr
X-Received: by 2002:a05:7300:e825:b0:366:42ad:7074 with SMTP id 5a478bee46e88-36642ad7654mr8064603eec.22.1792580345630;
        Wed, 21 Oct 2026 03:59:05 -0700 (PDT)
Received: from 6e52bff8000c ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198fb21sm6387219eec.23.2026.10.21.03.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:59:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
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
Subject: 
 =?utf-8?q?=5BREGRESSION=5D_stable/linux-6=2E12=2Ey=3A_=28build=29request_for?=
 =?utf-8?q?_member_=E2=80=98f=E2=80=99_in_something_not_a_structure_or_union?=
 =?utf-8?q?_in_arc=2E=2E=2E?=
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, stable@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 21 Oct 2026 10:59:04 -0000
Message-ID: <179258034449.241924.15241097267562754477@kernelci.org>

New build issue found on stable/linux-6.12.y:

---
request for member ‘f’ in something not a structure or union in arch/s390/mm/fault.o (arch/s390/mm/fault.c) [logspec:kbuild,kbuild.compiler.error]
---

Log excerpt:
=====================================================
/tmp/kci/linux/arch/s390/mm/fault.c:448:59: error: request for member ‘f’ in something not a structure or union
  448 |                         clear_bit(PG_arch_1, &folio->flags.f);
      |                                                           ^

=====================================================

When fixing this issue, please attribute this report according to the
patch submission rules:

Reported-by: kernelci.org bot <bot@kernelci.org>
Link: https://lore.kernel.org/all/179258034449.241924.15241097267562754477@kernelci.org/

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:07763fcc4cc009398ef2249ab57bfbb01900bd79
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
- commit HEAD:  85d82e0d7c2dfd3e75d34f35b7ebbf41f45c9c4e
- tags: v6.12.114

# Builds where the incident occurred:

## defconfig on (s390):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6ad8885055fda5076059d734

#regzbot introduced: 7fdb7c1824a1f9979d648d7ae28ac446bcee9c6e..85d82e0d7c2dfd3e75d34f35b7ebbf41f45c9c4e
#regzbot link: https://d.kernelci.org/i/maestro:07763fcc4cc009398ef2249ab57bfbb01900bd79

#kernelci issue maestro:07763fcc4cc009398ef2249ab57bfbb01900bd79

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
