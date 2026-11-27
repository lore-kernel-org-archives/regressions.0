Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794130;
	b=gr0vhnL5IXTk4LljIOIslO+2qhbXi104pvuBDnkYoodyroBvjPovl24yPilMSMrEVEHu
	 Oz+FMP2JsyRBy9sVwfuwPB+uffCUQZS1jDe3owG7c4imY0S+baHK3PS6Uw/QY+ktBoE1o
	 KtzuEozheJ+PyyHgaXPvKJlE2Fzy6fLAkUfzcPx3NFMnhIuXdbqDDy9WRq+hphOvzchMk
	 tibMZP+wPY0sMZqpSj9wmAZjM2VcFGXpl38/JnGfHcK8E64A4blteEl8ZCJ5A84ckkaT0
	 mMHHvbQg6HKL30kT+RiJ8Kyo750yORMtVjFA/qHFzf7yan8xKaFkEpbFCsb6BW0yWYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=e2fJZFZERBeQNZtQBCOfYByS4NMe3sHfsqjEP9dc6kw=;
	b=u+vT9WodpLs5LAGz+amdH6QAvbQLds823ttejmIKUjfnEyxonfKV4739NX0nIs0daeUw
	 BgVQ5G7WZWALAVfiPAQMVrBwP15B/lhBqAXLM2BVN8SUH+F8eEgrZ3r/qegYh54POWPFu
	 hwsBj1Ng2pAv+Q0Dh4VgBEgID6IIFe217nPzVzmVhN4IOnHpHM0IGTrOKLNZNxC1VgD0O
	 N6cj5+3138cvSVFVA+G74c9/vCF9nSnSldRlbb72KY+d/i+BMyQLuHw6UUimWf57rAqVF
	 eOrEcRCSNY4y1M3T6jfiyL7WgvOyEkM+mBGH1g6qKzT5ERwQkRpuSFrYQjCpqL43Dig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SPZeye3Z;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89C7606A31E
	for <regressions@lists.linux.dev>; Fri, 27 Nov 2026 15:42:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D89C7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SPZeye3Z
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so83783225e9.2
        for <regressions@lists.linux.dev>; Fri, 27 Nov 2026 07:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795794127; x=1796398927; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e2fJZFZERBeQNZtQBCOfYByS4NMe3sHfsqjEP9dc6kw=;
        b=SPZeye3ZsiWalqcv6Ga6AtJ4VUqjO9Sgi2az4AnEKMwiv3oeg+L7iGNCSJnVqtN0wa
         RoD9qn/89WkqKBdWXI9DtKPerN2OdSrNEXd+UfDnI8bNg13fr+P/FsZVyGDhKGwSEAl3
         5nngbCs72FxMgniVlnehgDpN1U8CwmZN3/lcPXcn+ENfMhQJaT2uthl+PD0Is9WpCZ+Y
         m+T2US53npGUoQKpGIUhZFP58weE1/AAMtjA57sqXjOYKpMtkqm/zITSeyvtbpVJFxvM
         rNqAqVWeeRJ+3Aw/ITLSWPvhdoIrDECnWBOrJwFPDLqXLnRCwhVnP3VqJhP3ircGtIPX
         kkfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794127; x=1796398927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e2fJZFZERBeQNZtQBCOfYByS4NMe3sHfsqjEP9dc6kw=;
        b=KxAECi2h0qn6GbWVBp9xIV+Bvd7RWjPR85Yk3YwaQra2MffbA9SAO+Vp4WcoTeAoY3
         c+4teFcl/q6c3oCbW7gH1EV9CCfdg+hjsy+G8BnE/3jnzR0NREiXZTMm88bQYgbVh98c
         6ogt1s+RSQT1g7y9M9kRYSkMPdWRvpd1URMdgRA3pclmIESVw23OlDM+YD8cvUoiEnlW
         jHxjaAulqnABuDYNhELVutcMOS2JtjgI24NYRHBhzuLwe2yTTkfPWPctrr5rJMZygJyf
         ocMkXnrgUYMrsn+ndXI+18e/UKON3vnL5zR0CvzJyh9w/UmTF46LZGaXzHJ8zT7QOdPj
         SyeA==
X-Forwarded-Encrypted: i=1; AL+hErFAKvSOi+395xY8xU8sv9TjoliZ4vCv2kiHJ9D070YJjv9OOK4NyOUnrJhkeKYPpS/ARbcJWVGmHhUjoA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/K/4iMyPvSqH0Yg2g+k87LvvJIvG/gBCRtlj5DJW4HtqGDDXOg
	9lClmjP2YOgAmaB9YbPIkI91qxo9568pZP8e1uRBgcMzIoFDBhF/iX1m
X-Gm-Gg: AZFdTZeGECDcCIPgnWC2qoRRur+bYBHTDFqZ8aw5eYwIoNFvyq7+chqYW5KENUAQiDF
	36ysMfzvHl5iIatWMEeNe8cTUsHu7w4k3oBEK/YDhhlJgRuBra0VMIqzaUxc21OJaP7HHfTD1m4
	B018ko+erhYBl/ZXKFTVKITDIteLrna4VmxUq5phSK6N/EjHRcNxj9KXAahvVUWDYYYN9BpfkQM
	IAlGhV/X2y2cxmqdKdtJvN5qS75yTojcxrSoH9/TbXJQRN5nTGy6/PjxwEq5zjtd5SmoesnR8Qc
	UHY0xmyVuMrtFpt9+/GSXrtB/38ggv3DXZp5GEaG6ciyyGnaeiPcvCI/qx/+j9QSArkES70BOG8
	CntU719IC+9rM1q3TfSFofzO220TMDGblhiY68pkePtwA1k/GsF5W7Pf6a4PCWdzZWtm1a32g6i
	h6g9yTipOIH+sD898g0IC2+ikbX222EntBCusQlA2q2vf+qZ9Shj1b7GAt8EJTrNTlla+kmJ0Ci
	5XW8zUVHR3mD8Qqj8kP1RV9FTfjeWofA6AecSuhD+VuNyqjwcD+xOTFDp1ESSNlRWRRl33zGwhP
	vIhdvcYpxkYyTCFgAYQ6aBSm9Lrtc0SdCKt/9oOdjrL1u8XLilXnzvjTCiuLLaiqkJ/cKrISEli
	eELn3srcINYxxT3RhnwR8wIhiCBcBhCqQz6nvzconQdfYVgGeGTkj7dXfAAVKPYVp8EiCj54tSC
	GnJym5k4n2FbYv
X-Received: by 2002:a05:600c:c173:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4bb88800134mr482703475e9.11.1795794126985;
        Fri, 27 Nov 2026 07:42:06 -0800 (PST)
Received: from localhost.localdomain ([31.223.101.75])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm959073745e9.13.2026.11.27.07.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:42:06 -0800 (PST)
From: Oguzhan KAYNAK <kaynak.oguzhan0@gmail.com>
To: Jon Mason <jdmason@kudzu.us>,
	Dave Jiang <dave.jiang@intel.com>,
	Allen Hubbe <allenbh@gmail.com>
Cc: Koichiro Den <den@valinux.co.jp>,
	ntb@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	yangqixiao <yangqixiao@inspur.com>,
	stable@vger.kernel.org,
	Oguzhan KAYNAK <kaynak.oguzhan0@gmail.com>
Subject: [PATCH v2] ntb: ntb_tool: accept hexadecimal addresses in peer_mw_trans again
Date: Fri, 27 Nov 2026 18:41:57 +0300
Message-Id: <20261127154157.3541-1-kaynak.oguzhan0@gmail.com>
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

Split the input at the ':' and parse the address with kstrtou64() in
base 0, which accepts decimal and hexadecimal. A negative address stays
rejected, as it is since that commit. The size is parsed with %zu as
before.

Found by running the NTB selftest against a virtual NTB device in
QEMU; the fix was tested the same way (the unmodified selftest passes,
hexadecimal writes to peer_mw_trans0 succeed, and malformed input
including a negative address is rejected).

Fixes: 21fbdc4d0b1e ("ntb/ntb_tool: correct sscanf format for u64 and size_t in tool_peer_mw_trans_write")
Cc: stable@vger.kernel.org
Cc: regressions@lists.linux.dev
Cc: yangqixiao <yangqixiao@inspur.com>
Suggested-by: Koichiro Den <den@valinux.co.jp>
Assisted-by: LLM
Signed-off-by: Oguzhan KAYNAK <kaynak.oguzhan0@gmail.com>
---
v2:
- Keep rejecting a negative address: split at ':' with strsep() and
  parse the address with kstrtou64(base 0) instead of going back to
  %lli (Koichiro Den).
- Koichiro's Reviewed-by on v1 is not carried over, as the code changed.

v1: https://lore.kernel.org/all/20261126031506.165973-1-kaynak.oguzhan0@gmail.com/

 drivers/ntb/test/ntb_tool.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

--- a/drivers/ntb/test/ntb_tool.c
+++ b/drivers/ntb/test/ntb_tool.c
@@ -927,7 +927,8 @@ static ssize_t tool_peer_mw_trans_write(
 	struct tool_mw *outmw = outmw_wrap->mw;
 	size_t buf_size, wsize;
 	char buf[TOOL_BUF_LEN];
-	int ret, n;
+	char *addr_str, *size_str;
+	int ret;
 	u64 addr;
 
 	buf_size = min(size, (sizeof(buf) - 1));
@@ -936,8 +937,16 @@ static ssize_t tool_peer_mw_trans_write(
 
 	buf[buf_size] = '\0';
 
-	n = sscanf(buf, "%llu:%zu", &addr, &wsize);
-	if (n != 2)
+	size_str = buf;
+	addr_str = strsep(&size_str, ":");
+	if (!size_str)
+		return -EINVAL;
+
+	ret = kstrtou64(addr_str, 0, &addr);
+	if (ret)
+		return ret;
+
+	if (sscanf(size_str, "%zu", &wsize) != 1)
 		return -EINVAL;
 
 	tool_free_peer_mw(outmw->tc, outmw->widx);
-- 
2.34.1

