Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793203380;
	b=mRhm5SnvZSoSI4I7a4exFnwdEh+1RHc/87UyfifTF2bze7OhVZndFXlZpWcCSS+suNpL
	 b7mkvzfEPYqXscdtXrezyK5GyaOzwAf0/NIYlwfjqkIBl1NlKntKRml9W4Fb7m2biBADg
	 1YSv1oLEf+3HEsXZv4D9/xx5j08Ir2rhANm4PXeOVkkn7Fi08BXobmxVQa4pY02ayhqY3
	 o0ZgTGbIgrrrjjkD8pvRd3wFghfRu/Lk6wp9GywPXPSGvndg6NT887NTyP/giI+knj91/
	 Y/VerZqjhdGAzN6VS7yRfu6UJV4SydXaQC/uUDb7suLa+iAL3kp+Y1+lmaaWgaW+a7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203380;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=wKs3vJN4ZKJpeX5LXglj/FvmPaj4cVCU3oClZIx8D0c=;
	b=xtfZgNiGDV4BvNGTqQkzU0vZdloVP60U680SDt3lS4bMEnushPSYtwapxLL4Vha5gr6p
	 SAWnywU1G78BDA6mMEOBHtKgP+OgR73PvA0OVVXojTLYTVjN+livUc+7ppdPy0ceYoiGj
	 Tq/gHqfZWKHTypo7r6ZsHcXMympwBYevBzTH5THpeJIlfExzm2C6rDApJyi1MM+C74lQZ
	 pPwbxFGFr4vjMixqWwAqQlvXthnpZxsxIVy/s1XM/u3TUPidsumSmS+WtIq1mVs0Sr4oe
	 lrJb4/SHTwZDeFpvCk728TRt0l0Kv1jNZUGp29SNd2ebLz0hRtNwEB2lO+rN+YcVgPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelburch.net;
	spf=pass smtp.mailfrom=michaelburch.net;
	arc=none smtp.remote-ip=79.135.106.112
Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F95606A31C
	for <regressions@lists.linux.dev>; Wed, 28 Oct 2026 16:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6F95606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=michaelburch.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelburch.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=michaelburch.net;
	s=protonmail; t=1793203370; x=1793462570;
	bh=wKs3vJN4ZKJpeX5LXglj/FvmPaj4cVCU3oClZIx8D0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Jt4sLcnfHw2wqjq78XGZQKUE3kF6VJbqSCvrO9nhkfFZNTCElSapRkr3tmLid51p/
	 42O2O4HYmn8Wgs45QxT5eMbBKDl1CiZDXRJcm7D5ZE8wVcIGug1NCaJfBg3fg0sjDO
	 XwN+uAE21c1rg7POSH5JUzepdIBq+kkjWxUj/fn0o+LUJfBb+H0eCc4l3V+i5gP4Ao
	 9UEprSoRMQXApBL0mdftZkPVFU9YnKHN1uS/ZgX74YARA1WMvuoUe+ZqqdKDrJs20x
	 zn5KEmXXR/z4ajmSKenJG8DLAhyxrfYX9/L8xHcbb25QjJJyJtEtPZEui0Dwdj80Fc
	 DDKZ2nMWelV0A==
X-Pm-Submission-Id: 4jFBw52kD8z2ScPp
From: Michael Burch <me@michaelburch.net>
To: regressions@leemhuis.info,
	Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH] Revert "phy: qcom: qmp-pcie: Skip PHY reset if already up"
Date: Wed, 28 Oct 2026 11:01:21 -0500
Message-ID: <20261028160121.10729-1-me@michaelburch.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <f6a49cbb-e000-4dcf-8b3b-61c3b8d934a9@leemhuis.info>
References: <20261013-qmp-pcie-skip-reset-revert-v1@michaelburch.net> <f6a49cbb-e000-4dcf-8b3b-61c3b8d934a9@leemhuis.info>
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


Yes, still needed. I retested today with unpatched upstream 7.3.0 on
the Dell XPS 13 9345 (X1E80100). It still reports "Device found, but not
active" for 1bf8000.pcie, enumerates only root port 0006:00:00.0, and
drops to dracut with no NVMe endpoint or /dev/nvme* devices. My patched
7.3.0 kernel with the revert boots successfully.


Thanks,
Michael
