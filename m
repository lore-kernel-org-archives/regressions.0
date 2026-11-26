Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795662921;
	b=mkSD6nQSYFJDjvfckilbhZOb1ZogqUVB7tpONG6aGCZSvFpfsdH1TBmGgDND2qvZ0W/k
	 coIs0SzrgWoS7ua5Z1TIBLGnhqE1JMTXrfgdXbu/jjJJMoPfw4a4H/dE4jqG64Bmk7axs
	 qY0Zoeup25y1kHLtxUYN0zZqBgsBEwzWckYR/N3DIzY6l5u18p5pakAsmnsqiC8ax6jXI
	 k/n/3ODy+OzyNEzhsUTkzxAtHd66YJXUQm5nzsdg2Rw0HWdGEZrTeFc8CgijoIIlkXCim
	 3KVFFpFn6kVs/1X+pAPKMJ91gvMIs0Lw2YAzfBd42wvkmM6WRVLG063WGIq8vblP2Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795662921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sNzRYBNLRKkf0Y/gp9OREoymKpw7SvFmjDC5u9+y2bU=;
	b=lXgHwRtYU37orsRGle/AJYnMe780sjUCRKdnnvxoL3br0ZOIZFDdL0NcbEdJ6exuPUdh
	 KDZaxk1inAjNuiIzMRTDWkPNiSYYsliZAc1gSaS08SKaOU7UaiCVuv4hzjGthtZsQ6e4g
	 5Hp+XOXm8D54ZZdhy8a3YiYfyph+LxbIJNqSrNi5QCFeq0nkFv3PoBqS2xERRxywuOA22
	 InbVyfTpty3sFgEe+YaWLXFCLftfktH10aa5+Mj5ZNqtAZJmreLURttREygEEBTpTi8/0
	 9sDkA8vFGOy7AShYIH0edYfp7fNWSBCyUwtq2aVzP1ARNlLmD6Q2FzczYmSV08NQNug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ZGP8/z3/";
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5020A606A32D
	for <regressions@lists.linux.dev>; Thu, 26 Nov 2026 03:15:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5020A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZGP8/z3/
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so52230225e9.3
        for <regressions@lists.linux.dev>; Wed, 25 Nov 2026 19:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795662919; x=1796267719; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sNzRYBNLRKkf0Y/gp9OREoymKpw7SvFmjDC5u9+y2bU=;
        b=ZGP8/z3/1no8K2E1WDpOoxojklCXFEj794LFuMmofOrKl36q817A0ytH1Gr2HWeCed
         ehJJ5c4K2xiMXdALHaSDjAZkEBSNeGS3hf0Q0NwPx9FDi4vuCFfgSPr9QG1nX/XCrEem
         ZPj4rWSKLHybXVrjIiiuTuEqH72IO08BgUJtEQd5l5QI3+vZpevTjKzBlb6bOQSzckd5
         avMtjKkcEnsVMoESIgQgrrYf4dzJt42hhZeXrUXDDMkLk0YwrJjgIzwgLJyAmvJhnQG/
         thLaWasWT1L8bCBIhKzPZDyoVCKbUE73lcYVJ67LdGt9zvU0WjelnKAjx+lZNHU7gkVt
         hRhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795662919; x=1796267719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sNzRYBNLRKkf0Y/gp9OREoymKpw7SvFmjDC5u9+y2bU=;
        b=O5p9M/CKbxN9crKiEPV9FAgrJN8i474kM8sTVSCmLz64GBIT/aiZzRfrzxWa85+MUV
         ItCIA/NOsPDsNravYN9cfSfXdjphdIOEj9GuzPMlRfFJI3FB7PUGzGxkT8yT/SiVfA9+
         FXDA5mqYruJyOuT5pWSZFy7gvrm30YD91MROuxMO4JQyAK3YQ0UbdOYfInGHuKXAnVCv
         JxGsG/GbxKt7SU6sk0AZ7RNEfqiMhV14eFnnff4gGD92OQANTmssfGdsE/L6RRvt6UDb
         hqBMUb8SAYZKYoMUgTBJGWVG0O4r2fd/nbZ7gwbU3PgTu+B7EjLpdDqWaYJFhmPjnUVE
         gl+Q==
X-Forwarded-Encrypted: i=1; AL+hErH4LjsG6OPxl7TSpYXPO2PnUcpcbsNLJspudnrUTaDe1FCi28ypfhXIxWFuIOn/jTMSm3tEKVA1LojGew==@lists.linux.dev
X-Gm-Message-State: APuU4Z8r9lewuAasTaTdmfzMrxCinE2mRgJP7HGUo/uwYEN9OzKO1ipl
	OZktSVHExrqW3McDN35CuBtDpMpm4886ZJ3Yy68WkEMCro4siAZ2NjsI
X-Gm-Gg: AZFdTZf9i/rj8aDL5v3xAVsozd5Pd+vwWmACdVZdh6bsD4wRWX5wgLishsZ6Og37BV0
	Z/ggXnBC+WUiRpQRok5DPTpetfuty/43/em6UO7QnT+E8m6kYKIGfiWTbdDRJlhyyxSIGt9Klzp
	FaRRER1X2QKh9xplEjlGhyOs+IuEmGd67bkVGaMaRLxlwQsjs5/qpO0f2rxpqWc3c/ThiOpcyTA
	gpoTiFWuDsQhZZqYZuRTW+YTu6PZaAbNvCv/C0GOBFqVWNE0ZH4d0jB8OJCoIVHYXDGQbpaG01e
	5CxSIem9u11UX2RKTJZrO2coFPq8grPK117fXTc7nrjBKinS3ntNJ5ZrWx02MffgbOHzkkouTD1
	pEOwv3WlrYG2HQYs36hZ2sxNXg8GGTpoAGKZR1fBBg0EjTAxWx1F46i6ELzsK++uKbgfdqRKRdm
	szkGsLi2minn3K0WXGdgamsNZxPL+CAfd164NMdPvCtBlZAU9U8ZghquRItz0ZkYj1t4R6LydCW
	zi/bdVmW8Dkm6og4vdkc6uwvQ+YUXmmeXaaSAGgi4vtla6teEfuLEr0d/2oSV/w5rfg39a5PNjG
	L72BkUBnwWJb8LHC8KXSFPRYy7kygKkA/qOJgUKj99rykyhs3IKFJuzRNSu//ISLsyiCeCdEVFn
	sSG9ilTFp6oplhy80spDA8lAJpDnqdl2p6mslUd93VR4CdFq2DinTe+OdPHdVn6pTET2y5+oMaK
	5Wp1Fu4hEsmUqfnmV6q04Qt+duSHpjlxLIng==
X-Received: by 2002:a05:600c:3b98:b0:4bb:7033:c92f with SMTP id 5b1f17b1804b1-4bb88826810mr384054565e9.11.1795662919396;
        Wed, 25 Nov 2026 19:15:19 -0800 (PST)
Received: from localhost.localdomain ([31.223.101.75])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3882sm37189290f8f.49.2026.11.25.19.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 19:15:19 -0800 (PST)
From: Oguzhan KAYNAK <kaynak.oguzhan0@gmail.com>
To: Jon Mason <jdmason@kudzu.us>,
	Dave Jiang <dave.jiang@intel.com>,
	Allen Hubbe <allenbh@gmail.com>
Cc: ntb@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Oguzhan KAYNAK <kaynak.oguzhan0@gmail.com>,
	stable@vger.kernel.org,
	regressions@lists.linux.dev,
	yangqixiao <yangqixiao@inspur.com>
Subject: [PATCH] ntb: ntb_tool: accept hexadecimal addresses in peer_mw_trans again
Date: Thu, 26 Nov 2026 06:15:06 +0300
Message-Id: <20261126031506.165973-1-kaynak.oguzhan0@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Commit 21fbdc4d0b1e ("ntb/ntb_tool: correct sscanf format for u64 and
size_t in tool_peer_mw_trans_write") changed the format of the
peer_mw_trans parser from "%lli:%zi" to "%llu:%zu". Unlike %lli, the
kernel's vsscanf() parses %llu in base 10 only, so an address written in
hexadecimal is read as 0, the ':' in the format no longer matches, and
the write fails with -EINVAL.

This breaks the usage documented at the top of ntb_tool.c
("echo 0xADD0BA5E:16384 > $DBG_DIR/peer0/peer_mw_trans0") and the NTB
selftest. tools/testing/selftests/ntb/ntb_test.sh writes back the "DMA
Address" that mw_trans<N> prints with %pad, i.e. in hexadecimal. As the
address format comes from ntb_tool itself, the first memory window test
fails this way independent of the NTB hardware driver:

  Running mw0 tests on: 0000:00:04.0 /  0000:00:05.0
  ntb_test.sh: line 117: echo: write error: Invalid argument

Parse the address with %lli again, which accepts any base, as before
that commit. To keep the format and the argument type matching, which
was the point of that commit, store it in a long long; it is passed on
as u64 as before. A negative address is accepted and converted to u64,
as it was before that commit. Keep %zu for the size.

Found by running the NTB selftest against a virtual NTB device in
QEMU; the fix was tested the same way (the unmodified selftest passes,
and hexadecimal writes to peer_mw_trans0 succeed 10 out of 10 times).

Fixes: 21fbdc4d0b1e ("ntb/ntb_tool: correct sscanf format for u64 and size_t in tool_peer_mw_trans_write")
Cc: stable@vger.kernel.org
Cc: regressions@lists.linux.dev
Cc: yangqixiao <yangqixiao@inspur.com>
Assisted-by: LLM
Signed-off-by: Oguzhan KAYNAK <kaynak.oguzhan0@gmail.com>
---
 drivers/ntb/test/ntb_tool.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/drivers/ntb/test/ntb_tool.c
+++ b/drivers/ntb/test/ntb_tool.c
@@ -928,7 +928,7 @@ static ssize_t tool_peer_mw_trans_write(
 	size_t buf_size, wsize;
 	char buf[TOOL_BUF_LEN];
 	int ret, n;
-	u64 addr;
+	long long addr;
 
 	buf_size = min(size, (sizeof(buf) - 1));
 	if (copy_from_user(buf, ubuf, buf_size))
@@ -936,7 +936,7 @@ static ssize_t tool_peer_mw_trans_write(
 
 	buf[buf_size] = '\0';
 
-	n = sscanf(buf, "%llu:%zu", &addr, &wsize);
+	n = sscanf(buf, "%lli:%zu", &addr, &wsize);
 	if (n != 2)
 		return -EINVAL;
 
-- 
2.34.1

