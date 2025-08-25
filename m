Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01FA2750F0
	for <regressions@lists.linux.dev>; Mon, 25 Aug 2025 06:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756102184; cv=none; b=YSBfGpjU6MjmhjZ/mvsKZYA7zpA1SEb2wenxV3mZJKdBUZVxORT2YqXpyMN7lgOsOi01+jajDG8vHKswQ9IiK6PhDp1XQLm4vgln7hssizuytAPdQD6geLnjW+p7GI5b1Q/KzmwuJ0vSwymDb1Q2ELw/ahU2mcUuArtdSkRKZq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756102184; c=relaxed/simple;
	bh=Uh3C5KzgehWTf7PBs8GBkkXVoSNOHZeQx8B+f8Jht+s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q6HGLqCTSDBb0eqLkHJTH/w4JbkIFXTgrK2ILNWxAeVACzQ3jb8MYMzjX4eV0CGe2tK6Lxg3gTs8NW0vnbEHkkLd62mORU5yNOSO+LTeEJaGxbYI4KwsA2gesFX990Ay82LPMVxcvEtvzRq0GgVvYMi4J4Ca93mw74UdMxNtxhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wk4gNN5y; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wk4gNN5y"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3c8b0f1b699so651102f8f.0
        for <regressions@lists.linux.dev>; Sun, 24 Aug 2025 23:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756102180; x=1756706980; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dNGUiH1HlaDsvr1HkUqzRQTsgKZhSr885hmNIdYPFpk=;
        b=Wk4gNN5yL3mtzWmOwQONoDz98qIMdycWdKPy43CR2fYSKSPb12+60aCF/NLbrxUdmZ
         LZqQwklHTWZRQrxzJpYaiUkKNFHyiIdD+x2ST+m99pV+GzjomPNG08a++kvkX047sKKV
         bjY0RRyTI08VR3O3zzLiPg2sb4HwRfLf1hUCFBPnJlWtAPJY6wriRqh54CDTzQA/nJJJ
         TEHRJr2NLFvbIK4r7yohn8KMulDZggHVFAQ2W0bZTp9AAbGEojjBUsb1N1zcikn+8ec9
         J42XJirW6/vm9zHHiC1MxMCDHjuYbCJDk1BINkbUUiJJM1+mEd4SzTb5OSSNb6yueGIj
         1utw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756102180; x=1756706980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dNGUiH1HlaDsvr1HkUqzRQTsgKZhSr885hmNIdYPFpk=;
        b=Rjmt1imr39gIHhRXMwa0DyW9HWizQinpno0tYcjgCWmIJzqCl41/E+nk+EGt6ijf5I
         3VtOqrXEPWLAkc4ZJqdVVl2yvqUzt3nD7rN5XzmR9AcnALHJHwRoyDBb0d/Po79mu0zX
         rnOPRUWVSD3D0vROnB4yuNN3vsov6NGzzBYphHwGq44GCRI4qpHJYrTz1cGvo5736E08
         +tg+Y8PyQiiYbcwAaBE+6Xap11nQlD5Z8NBr5QsJqw3pEmXfly/spo1GuD8kRxk8v/J6
         02kfmFVXxb85dHfaPH1e0+gjFPEfmkxZ1TGd8kB1vDdUWPe4+SVRqzNxi3damjlLrwd2
         YcXg==
X-Forwarded-Encrypted: i=1; AJvYcCXosli74JST/I1PnKWdsCsZ9LVjqSdL9QfXQhzbT6fFPjquO59Ss18oHNTHmNbBURFYc79c4gTQvuvMOA==@lists.linux.dev
X-Gm-Message-State: AOJu0YytoqZriL8HvU+gwLnP6guHw/DGtq3a0kiBLqUu56XwQPaK1GCw
	AmO5aDtz/klNPIGV4FN/TPb4Ij4QJ9HHF+rTuOSvSpmbNEQ839Pbu4ph
X-Gm-Gg: ASbGncuShwTVcmuGVaJ4VeqU91q7V7BIEaWDklbEcDRmJowxHmHO0Cd2vzYwi62Qa3c
	SnQ9B77fmevNhzFD1iTpqairEUY60Zi2VH51QemI2Vzpl4ViY3GnM4okUJ7iVgad5apoKY6tlmz
	Q4uuN9uQuSKzL4WxEQx3iIRo62friQWHUo4xt+84pEvXG15LeNHy9czmsix1bbeKvuhk4TRBON7
	y7MMU+2guimV0OAubaAs9vEqVJxFgBQ54mS2rXkGtJKBxWxKnfMq3Zn9rBqhV3xn4e2NVBzTeu8
	YH2HdBHmxJ0ROl4bacQZb2QSsL6LaVXRVM7gSHOw+E/P3h+ucSIWUrPbhAtinRAGhxgIGjW4SQH
	ORFFK5//Bg58zWCARHMHymQ==
X-Google-Smtp-Source: AGHT+IHcrevRUj1cD5LeAp4LI1B3nH7eEN5AQX9rs7eSbOAM9Hvpepk/llONPE+TUwRHg/i9+KJPcQ==
X-Received: by 2002:a05:6000:24c4:b0:3a6:c923:bc5f with SMTP id ffacd0b85a97d-3c5dae061dfmr7042185f8f.17.1756102179839;
        Sun, 24 Aug 2025 23:09:39 -0700 (PDT)
Received: from oscar-xps.. ([45.128.133.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b5759274asm94690775e9.23.2025.08.24.23.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 23:09:39 -0700 (PDT)
From: Oscar Maes <oscmaes92@gmail.com>
To: bacs@librecast.net,
	brett@librecast.net,
	kuba@kernel.org
Cc: davem@davemloft.net,
	dsahern@kernel.org,
	netdev@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org,
	Oscar Maes <oscmaes92@gmail.com>
Subject: [PATCH net 2/2] selftests: net: add test for destination in broadcast packets
Date: Mon, 25 Aug 2025 08:09:18 +0200
Message-Id: <20250825060918.4799-2-oscmaes92@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250825060918.4799-1-oscmaes92@gmail.com>
References: <20250825060229-oscmaes92@gmail.com>
 <20250825060918.4799-1-oscmaes92@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add test to check the broadcast ethernet destination field is set
correctly.

This test sends a broadcast ping, captures it using tcpdump and
ensures that all bits of the 6 octet ethernet destination address
are correctly set by examining the output capture file.

Signed-off-by: Oscar Maes <oscmaes92@gmail.com>
---
 tools/testing/selftests/net/Makefile          |  1 +
 .../selftests/net/broadcast_ether_dst.sh      | 82 +++++++++++++++++++
 2 files changed, 83 insertions(+)
 create mode 100755 tools/testing/selftests/net/broadcast_ether_dst.sh

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index b31a71f2b372..463642a78eea 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -116,6 +116,7 @@ TEST_GEN_FILES += skf_net_off
 TEST_GEN_FILES += tfo
 TEST_PROGS += tfo_passive.sh
 TEST_PROGS += broadcast_pmtu.sh
+TEST_PROGS += broadcast_ether_dst.sh
 TEST_PROGS += ipv6_force_forwarding.sh
 
 # YNL files, must be before "include ..lib.mk"
diff --git a/tools/testing/selftests/net/broadcast_ether_dst.sh b/tools/testing/selftests/net/broadcast_ether_dst.sh
new file mode 100755
index 000000000000..865b5c7c8c8a
--- /dev/null
+++ b/tools/testing/selftests/net/broadcast_ether_dst.sh
@@ -0,0 +1,82 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Author: Brett A C Sheffield <bacs@librecast.net>
+# Author: Oscar Maes <oscmaes92@gmail.com>
+#
+# Ensure destination ethernet field is correctly set for
+# broadcast packets
+
+source lib.sh
+
+CLIENT_IP4="192.168.0.1"
+GW_IP4="192.168.0.2"
+
+setup() {
+	setup_ns CLIENT_NS SERVER_NS
+
+	ip -net "${SERVER_NS}" link add link1 type veth \
+		peer name link0 netns "${CLIENT_NS}"
+
+	ip -net "${CLIENT_NS}" link set link0 up
+	ip -net "${CLIENT_NS}" addr add "${CLIENT_IP4}"/24 dev link0
+
+	ip -net "${SERVER_NS}" link set link1 up
+
+	ip -net "${CLIENT_NS}" route add default via "${GW_IP4}"
+	ip netns exec "${CLIENT_NS}" arp -s "${GW_IP4}" 00:11:22:33:44:55
+}
+
+cleanup() {
+	rm -f "${CAPFILE}"
+	ip -net "${SERVER_NS}" link del link1
+	cleanup_ns "${CLIENT_NS}" "${SERVER_NS}"
+}
+
+test_broadcast_ether_dst() {
+	local rc=0
+	CAPFILE=$(mktemp -u cap.XXXXXXXXXX)
+
+	echo "Testing ethernet broadcast destination"
+
+	# start tcpdump listening for icmp
+	# tcpdump will exit after receiving a single packet
+	# timeout will kill tcpdump if it is still running after 2s
+	timeout 2s ip netns exec "${CLIENT_NS}" \
+		tcpdump -i link0 -c 1 -w "${CAPFILE}" icmp &> /dev/null &
+	pid=$!
+	sleep 0.1 # let tcpdump wake up
+
+	# send broadcast ping
+	ip netns exec "${CLIENT_NS}" \
+		ping -W0.01 -c1 -b 255.255.255.255 &> /dev/null
+
+	# wait for tcpdump for exit after receiving packet
+	wait "${pid}"
+
+	# compare ethernet destination field to ff:ff:ff:ff:ff:ff
+	ether_dst=$(tcpdump -r "${CAPFILE}" -tnne 2>/dev/null | \
+			awk '{sub(/,/,"",$3); print $3}')
+	if [[ "${ether_dst}" == "ff:ff:ff:ff:ff:ff" ]]; then
+		echo "[ OK ]"
+		rc="${ksft_pass}"
+	else
+		echo "[FAIL] expected dst ether addr to be ff:ff:ff:ff:ff:ff," \
+			"got ${ether_dst}"
+		rc="${ksft_fail}"
+	fi
+
+	return "${rc}"
+}
+
+if [ ! -x "$(command -v tcpdump)" ]; then
+	echo "SKIP: Could not run test without tcpdump tool"
+	exit "${ksft_skip}"
+fi
+
+trap cleanup EXIT
+
+setup
+test_broadcast_ether_dst
+
+exit $?
-- 
2.39.5

