Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB29012D766
	for <regressions@lists.linux.dev>; Thu,  9 May 2024 23:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715297298; cv=none; b=HxYr2F9ix4bPuvDVv20Iu9H2U5oXLr7aMjvyickgd5HzJxfjsea2E+JVY4BSDnG58k+zEacVUTFEu3P9dWIk4gBPbG6xbo6ahrL87nMELzwbN7MQ0rgjcpVrQdL+yiSeW1fqeI2u6+kUMD9b43eOcIpg6qyo0wWNrRNtM28LC4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715297298; c=relaxed/simple;
	bh=3W+Mx3xzmpw6kHUUXYG3d0L0Hbd+8X6rtOxjlnAcfrg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=q64yKTUmrDUShTZSEnwHbqEaok9LJiNlgb4YutVW42GHKOyqvwk1N1OyO4H5iIHwXvRLcMSrZj5NDWyj5MDPeuADUafdrhNloMXO2f0d0t9NjcmzPANwhb8XDVHbHlc6Tq3lZbRAIIqWPXkoPxw8YKvvBjgbNpjRkZkGq2dqABw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CscXU2BK; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CscXU2BK"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-61be613d903so15806317b3.0
        for <regressions@lists.linux.dev>; Thu, 09 May 2024 16:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715297296; x=1715902096; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3W+Mx3xzmpw6kHUUXYG3d0L0Hbd+8X6rtOxjlnAcfrg=;
        b=CscXU2BKBHGrlV3hqAgHVaVkAlvYv7R/Nq5jQnPLQDtI2kJggskCghdQ8h5ioO5qEy
         rzXja8yQlQfmAB4Myv/RxILzYWLGvVBtIrwodwUVLzgYDp0wc7QLWZWwr5P0AuATfCg6
         RO0uxDyqWqUOtkX5ywERepS/CFIG8j7w6I611Tmj48aV5R0oDx6sIUe+gZfLQ44+j0Uy
         ECFF0jAqa7ZXMH3wxF2X+qu0WJR/zCYnn00i+GVKm5U/OjPuRzAlJD050ii+9J6ZeRoh
         zOS13YStfQ7SgyrVDPR196VzDbWzCEe1/+pCamW07g+Ow+vqJtZ8mb+46AomHTRYygow
         Bzaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715297296; x=1715902096;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3W+Mx3xzmpw6kHUUXYG3d0L0Hbd+8X6rtOxjlnAcfrg=;
        b=IFMvf0JIH6cvo/QCy1cngagTZSd2zyfNhI/q5bF53vODEsBw0OCoGYyfQgsOpMDJbP
         SjhPe94v/aF+IKf6CWAmc41lQQeTDy3ZGO8AM876tv9VN8ini5SO4QZWUzG+xOER/Z0G
         wnH1gXLaVNVOsxxyl6wwTxmoNZXvMEeRCzWSIZYJKqdbiP6Hg5rKRpcStDBhMpSF8MT4
         Kh3Y49QfhViPhvLfFb8omGplmvO2sLV/WaeBejjv30z972lSSqD5RuT9t4e+nfzdhffb
         l8IEUV7KLqIoQs3FwphhUOdNIGM778n1y5DPk3bzbPj7csqu7oqQ9vTk1qdz/R53bl0K
         RCgw==
X-Gm-Message-State: AOJu0Yz4XpPTtsaEYJk1+1EaGx4sJwf0nHMauqz/GaibpKwli/PY4M4b
	AtISmghEYulp6+3Ujw7kyorWmnVhA/biI9Ml7ScgodBKHNHLmavTridL5Gbtfdhpyr1BA9gesAQ
	UBCR91aKXjaMiXTb+Ub2qsB131vHnYnjL
X-Google-Smtp-Source: AGHT+IErGTPJ0o7C2dh4mtaobPI0XPqdk0btITC0JFDEqcl1b05uBMR440GktnT9eSE0LAqeKYcTjn1tfrfSdtHRXTE=
X-Received: by 2002:a81:6d05:0:b0:611:26e0:f24b with SMTP id
 00721157ae682-622aff3c05emr9957657b3.9.1715297295721; Thu, 09 May 2024
 16:28:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Chris Bainbridge <chris.bainbridge@gmail.com>
Date: Fri, 10 May 2024 00:28:05 +0100
Message-ID: <CAP-bSRa0ADA_wpkAVXJw60O8f=cxXVWuxwxfFBFE1y==jDSuZA@mail.gmail.com>
Subject: [REGRESSION] amdgpu: Unplug dock while suspended results in
 dcn21_link_encoder_acquire_phy crash on resume, *ERROR* dpcd write failed to
 set fec_ready
To: regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Details on AMD bugtracker https://gitlab.freedesktop.org/drm/amd/-/issues/3345

#regzbot introduced: ec5fa9fcdeca69edf7dab5ca3b2e0ceb1c08fe9a
#regzbot monitor: https://gitlab.freedesktop.org/drm/amd/-/issues/3345
