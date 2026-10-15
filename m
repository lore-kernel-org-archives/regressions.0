Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2580448CF6
	for <regressions@lists.linux.dev>; Thu, 15 Oct 2026 18:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792089650; cv=none; b=Gs6ct0wvprifL1h+T1aHB0+noe/MD/iEtcJwbPOUiGCWuiyjYQhU+YhxDOnIQKAEP8JMpkKbkVyLnd3YIhkpbH49grjfscNKUPsHVssidlQds8T51qfUFoSGJSIgZaAlL2cUadcv9W56MN50nhLtPm0YEa6mGs/Gp4eNHJWZy/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792089650; c=relaxed/simple;
	bh=V5yzgDr21nxczhxKu9JiO+Rl3gBcr/Doa1CAdEco8JU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tIe61zPY5TCFcDKSC/20X23GcjXSGntP8f41FvJkPjhLQBm1aw0k8ed6kF0M5ayZoNYmlqcjzAotBEnx+rjt/jv2vGj2nTJAtQqQmbK6TxT7+oxaIKViE7jejbLVMS6VJerCx9U8XeQJbpMz0bEU1hWfE4VhQHaFJH+6CcCP3w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nGxIWCss; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nGxIWCss"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1ad2e2391so24906565e9.0
        for <regressions@lists.linux.dev>; Thu, 15 Oct 2026 11:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792089647; x=1792694447; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rGkil06XO3g5opDlFSJDhdb0jcGxqJIbAxYs8/6p9Sc=;
        b=nGxIWCssoCWKsDb2VJ8b4b2QuFWvSMtIiEHl9uMrh39WNUyH1pO+qYKFGqW3uucKUp
         t2uqR5bUH+WadksxQr1MZg/tqbd4iZcn05RpG7g8u9GVeDrhiS9Rz0LDoJa/LRAKo+eT
         sCzWq/NAo5XomNfcUc2JNrjGRCRgslCowGsyS8wm+esC/kpsr7IzOhwwI8CXwPRriOgP
         MrvxhQT66qmCrChspAALF1sq1r6VYjMUMFbEsUkCal8c11f+RT0fAd9dX/9jN5WYePGq
         o4GksbZBXaSXxu1F77Fu0uEZ58jotEGpY/mYeDBTbJJgglk58ZAVmyr9BfY9ayC1laAj
         sfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792089647; x=1792694447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rGkil06XO3g5opDlFSJDhdb0jcGxqJIbAxYs8/6p9Sc=;
        b=SKaTOahD8TdoH+EDjxAhYgwJwPQkHbIgY2PnpU6lYpQmSfNw2Z6cLn/2Va7BBSlRhZ
         X9iiKf9XMkOeBXFOG8hzFBUIBk4Yj33n9iIrg0yWQHneBV8x+dljyLY8n0LWnzJvuGbM
         parr6E3WB8HQBG5f7f92ZC89+pGUslNy6Txr/WcIa2IqYnPdyGBDVSLSCGDxqmroK1fw
         6OBS72Z9Jk4RATyvCvP+lNHrK1d5hCVZW0PzTUdJ6X5CiEhcLthiF59FnChU8ragHiOu
         v3Qy9l8JWB2wv1+TlR90rA1aAE2MqU8eGRDcrvUwUohiwCD94FBvpkWDorvKxrCuL8S4
         l9Tw==
X-Forwarded-Encrypted: i=1; AKwUvBzoLbZnNA80AYtse0nq8ZqksNbPbLS6EyGk9LCeJ73gRCAYpn6Tl4TjxEq6NBls9XN/cX6yhZWkZ1cw4g==@lists.linux.dev
X-Gm-Message-State: AFq9FYKOWFAZFULp7tkUjQ5CMJDL25eVRvqm6O5IQrJyksDI/AxqTAQK
	yqiRa2/q/8fZB4gjvXQmEvmPMoE0SPm+D/L4KJHrSe8OEYRvcJlIrXHf
X-Gm-Gg: AYBFou3qme7cVP2rShkk36C1TgKC+wRPNrOzfe5v+69sCm7s+AtTfHGijCK4KxJ1FZk
	/F+Sx6qd4d/F/refgkeQTrlJAUtgGNxO4S5s9u9Qd4PeBabvUNJJxnB4jtkS8WQcBDZSxIjaBXn
	b/Kz3alDqClK/xZDYgXv0CRWioT7OmFKnA7k3O0xcTL1e8oZbw4HiKemsTBIxNSpoI3ZmvDN5eH
	ot9MEYtKqhTM2voUH+iqfSVsOGtGuawF9fBc/FgotkJyAdOkzt5Lzo6rRjyFKDHuI4B5qJJEVVg
	H3znMn0pJS3mCU1FH5jYNHsDQBtwryOWARPLkQhk+j4KlbFBl6lrszTNYkHuGyYnppR1QwzjyTf
	k2wjVa5yZJa2QiIA4knJ7tgheluvtb3WazMPyoywthY+fOBzXc5yLsYmDfephtvmWeH4QZZLPVS
	51MNb7SgYvbw9TPOCBeGc2lfHGoDgCZz282Qn39kbj0NpvmTsFRYqUT44DDVvjhPkEtp41AjW4d
	1Ar
X-Received: by 2002:a05:600c:4689:b0:4a0:1cfd:321 with SMTP id 5b1f17b1804b1-4a18e4a9b31mr429219275e9.12.1792089646475;
        Thu, 15 Oct 2026 11:40:46 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd67a080sm88337045e9.3.2026.10.15.11.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 11:40:45 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	Sasha Levin <sashal@kernel.org>,
	linux-wireless@vger.kernel.org,
	stable@vger.kernel.org,
	regressions@lists.linux.dev,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH v2] wifi: ath9k: reject short WMI command responses
Date: Thu, 15 Oct 2026 20:40:44 +0200
Message-ID: <20261015184044.1321868-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814075837.20005-1-pengpeng@iscas.ac.cn>
References: 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

this change breaks ath9k_htc with the AR9271 firmware from linux-firmware
(ath9k_htc/htc_9271-1.4.0.fw, "FW Version: 1.4"). The firmware answers
most commands with an empty payload, while the driver passes a response
buffer for every command: cmd_rsp in WMI_CMD()/WMI_CMD_BUF(), the 4-byte
value of WMI_REG_WRITE_CMDID, the 4- or 12-byte buffer of
WMI_REG_RMW_CMDID. With the new check all of these calls return
-EMSGSIZE, and bringing the interface up fails (hostapd: "Could not set
interface wlan0 flags (UP): Message too long").

Seen on a Colibri VF50 (Vybrid, armv7) with an AR9271 USB adapter on
6.12.113, which carries this commit as 03ef61d05aa2. A log line in
ath9k_wmi_rsp_callback() for every rejected response shows, during boot
and interface up:

  WMI_ATH_INIT_CMDID          0 bytes, 1 expected
  WMI_START_RECV_CMDID        0 bytes, 1 expected
  WMI_FLUSH_RECV_CMDID        0 bytes, 1 expected
  WMI_SET_MODE_CMDID          0 bytes, 1 expected
  WMI_REG_WRITE_CMDID         0 bytes, 4 expected
  WMI_TARGET_IC_UPDATE_CMDID  0 bytes, 1 expected
  WMI_REG_RMW_CMDID           0 bytes, 12 or 4 expected

With the commit reverted on the same kernel, logging instead of rejecting,
the same commands keep answering with 0 bytes, and so do
WMI_DISABLE_INTR_CMDID, WMI_ENABLE_INTR_CMDID, WMI_DRAIN_TXQ_ALL_CMDID,
WMI_STOP_RECV_CMDID, WMI_NODE_CREATE/REMOVE_CMDID and
WMI_VAP_CREATE/REMOVE_CMDID. WMI_REG_READ_CMDID is the only command in
the log that returns data.

So an empty reply is how this firmware answers a command without a
result, and rejecting it takes the device down. I have not tried other
firmware versions. I can test a fix on this hardware.

#regzbot introduced: 93ce8ea70451

Thanks,
Mehmet
