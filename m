Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970101CD208
	for <regressions@lists.linux.dev>; Tue, 26 Aug 2025 12:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756210710; cv=none; b=ZP7NdQggQqVxlGmeiiNt8YOe9nAKY2R62nLtWpLbtKJeVgoFUEF9NZU3Hp0UYhD1J65mV//2osdqt9AfoFnGhxgDBEV/PvdTagVq5j93wtNBYxO7TCuBzbwoIwpKPnH0jzSOY4wigW48TBBEoaAWzbSLlQhbKHxHOdx+FeRW8Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756210710; c=relaxed/simple;
	bh=xl7TGiKrLZLjjRkY4r2IBQ4zmCgxfGdphk5O0Hawwnk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m4njptMu5alT+MjXxnZGmNE9kasKJLgOZ9FiSIf9OLEhKKBEOfye8XY4cNeD8GRxnJaSLsPCDf3e6qQpjOLbEEbU/j0to0Ld7MyVv2jP5Kd2NFzwW7BhncUgTtQ8hqpp0guzGIjyQwqYjDnbgQcl4OmbndR6P1KMOg95O5mbB9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CcX9T7sQ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CcX9T7sQ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45a1b0bd237so42277085e9.2
        for <regressions@lists.linux.dev>; Tue, 26 Aug 2025 05:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756210707; x=1756815507; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uUquV0WS+fxJUivCT1xUeaF0YeOMY0unvquPcAzHaLs=;
        b=CcX9T7sQjLm4AVmtU9W+Q0PoMoNovotl8ikX6TgoMJXEee0l36mAYYEbU/OM4CdKgS
         K5Qxg9xxywgBMizFAVcV96cY8KOfhZU+cEPLa6vXRCRTv0l/M1/qMavw8JN3jQqy4Vhh
         9+N6FLwjX9V+m+SG1OqYOEMfvSzJb27Pad/Iuyxwq7/oi+kY/0fEMLhuHEHDUdMF6UwJ
         SgiRPHJICN4WVx3I6dGNrcs9t8AHBQc44olxPOAIl0UzCDGb1JsrRiXu5ljlv3+IQE10
         9jJuafY9IK7cn6YEf302JYrHABMQI+iLhNTjUiAJXgTH0qB/r1tsr7nu4sFGrUlpc/1I
         2aSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756210707; x=1756815507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uUquV0WS+fxJUivCT1xUeaF0YeOMY0unvquPcAzHaLs=;
        b=j2LsG5tNNJ5ntLt+s84CutUukqn71mmQSqOHh+A1Z83ydxUCpbQ60Xczjg5A295tDw
         dNcfWK+wvq+pv2UOO1iuJqSzkP/IYiAmHpch6NJ6+f2nG4gp5paclHtwPF/w3V3QqDwI
         nMD5Ql8vwPMj4S1jn3R5aDvYBdKsL+eTmDJGZS8g1gfhIp1pEbpsBtnN96LA++x5Tkg5
         va5DELAaWk7vTQS45wFs3RnoRoSLd6DPPDXnQh9iInVyt0ekIukuA8oMsesohn4x2LFj
         Ei3g1Nz8f+58C/ieCO0ZQgMZsicZNe1r1QDCebtyKAFhXH5uB6GrmfCeIfdaFg8hNRQk
         4bkw==
X-Forwarded-Encrypted: i=1; AJvYcCXBoK90OEWoytiOUi34J2ZzKz0ui5Ab5f1TLTfETwAfMP9pxC7BGCkje+QLPqF/F9OUCHrBOJx9/p4SXA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyOvHWaVGpwTiC6PzkErUDE80ZXkse2TiMqMasipC0KVvaP3ApD
	wSfsI2qi8AhzwJwXxO6u27c4KBI7eQ/oLxeSF/R/zxGDebmxzauxQDkm
X-Gm-Gg: ASbGncuKLTEPvjsAhC8Ug4MIsCjXUjnSRXAUAd8onYBk+IDI+EEiHK+EjwSDzSJ7Udt
	qBVeYaBaBV4th5UYgb88Ms43FiyJI+lGQDFkqTE/B6I0zq6OSzk06cPSpTLmnlfoc/mgtqJ1xDD
	t3Hz+7S12ft9FUVqpnvfLeMnQMAoZC+5wHSwUD56CLyeWrZMJg1+Fvgdc8UEofS1CznvoV1ZFSv
	NEOg9wzYw2PWkyMJzTbegWEXq3NTSp33cRywumE9ylS69LW8wINNArneHkAojx+GLmxfgvpgzME
	XRfsInC9OnBmElALCfgJ0GTqdLaK9bLds8UtkfwGihC0EcH5PDansC7ocNtI98A3p6lplQkhNrg
	nZuGTkXD9Vz3x1IOQ6rFFkfTE1Xus5H88
X-Google-Smtp-Source: AGHT+IFA+w9zyLiHWHSxzU53Rb5LUj410W6JWkcnK35EtrBXTWpbfg8retqet4NA+n39H/gbCoK57Q==
X-Received: by 2002:a05:600c:3b85:b0:459:d780:3604 with SMTP id 5b1f17b1804b1-45b689f27ddmr12881755e9.3.1756210706739;
        Tue, 26 Aug 2025 05:18:26 -0700 (PDT)
Received: from oscar-xps.. ([45.128.133.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b5758a0bfsm149513675e9.20.2025.08.26.05.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 05:18:26 -0700 (PDT)
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
Subject: [PATCH net v2 2/2] selftests: net: add test for destination in broadcast packets
Date: Tue, 26 Aug 2025 14:17:50 +0200
Message-Id: <20250826121750.8451-2-oscmaes92@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250826121126-oscmaes92@gmail.com>
References: <20250826121126-oscmaes92@gmail.com>
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

Thanks to Brett Sheffield for the initial selftest!
---
 tools/testing/selftests/net/Makefile          |  1 +
 .../selftests/net/broadcast_ether_dst.sh      | 82 +++++++++++++++++++
 2 files changed, 83 insertions(+)
 create mode 100755 tools/testing/selftests/net/broadcast_ether_dst.sh

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index eef0b8f8a7b0..9bbe1d010f5a 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -116,6 +116,7 @@ TEST_GEN_FILES += skf_net_off
 TEST_GEN_FILES += tfo
 TEST_PROGS += tfo_passive.sh
 TEST_PROGS += broadcast_pmtu.sh
+TEST_PROGS += broadcast_ether_dst.sh
 TEST_PROGS += ipv6_force_forwarding.sh
 TEST_PROGS += route_hint.sh
 
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

