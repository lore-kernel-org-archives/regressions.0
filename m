Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4107E22
	for <regressions@lists.linux.dev>; Wed, 21 Sep 2022 10:35:52 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id y3so12656637ejc.1
        for <regressions@lists.linux.dev>; Wed, 21 Sep 2022 03:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=vWTx9waxxwXRcamt4ePCJ74t1njaL9ZrGOeuhdI5nro=;
        b=s3/zWeZf0K6JlcMz68yA4amBwBVAratLAs4TitSGSWrUF7jSEaercPgB435AdKIgST
         sU8Cc96EMdJuaaW/RujVYHjga3Tr8y/70utRZgnSsbQzEop5DUn23X2gDJCY8SBXHfb1
         ungajh15QI0Y7prHu+d6033i8RFixVFx3TmgGZsO43LhbV3MPeT96iQxUOjeVIr/3VD7
         qzFQDhqSNN8OlLHWogZut17ZNQJVSkz70x03KufUaYFQQxgSKZlSvLx9K/HImbSUblo9
         xajMFezGzHdmBMQlx7t5faxa12Fq5yMrTEJ8Ajo7QGcTvLQQtqcI08BvazMyGk7078ET
         ZYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=vWTx9waxxwXRcamt4ePCJ74t1njaL9ZrGOeuhdI5nro=;
        b=RgJLlvm3KL21ksQ0X02myTCC77zynUhogqIFOwwtvnv3aTTMlSYcDb8MrhNJ3wgAlB
         j4kfkJBCGgaAY2bZ8ELjkKL92lKTEeq4PEOAaE+U8Ta+4UBHs2jGYnjplMo/lVQArxB/
         jp47oEZNBxmZuaMOjXvQ55/298328MyOf4xZnwPSa9VSpDbSOXb/2C5egS9bhtNlLJgR
         /7qK0aOqRa2k59TISugyyXehxFdwt0L2d6FhDoYVNcTFUevda9C9n7bItGJ4dVF7Gvwm
         Q8YHIabNX7+cjJB5Ih+qT8GBsWNAzP5303bb0pT+E2QqvPPk6mC7JxCJVCzig9/bJIE2
         Z5lw==
X-Gm-Message-State: ACrzQf23AjmqiHVXqLtF2vrv2LhZ0LWFlYQPvrN+Gpu2Xlam2aw534Gt
	A0oXLxIRMNqZWXuEaYEdhR9VCYK7Wjl/4irIFZnr8Q==
X-Google-Smtp-Source: AMsMyM6GsnvJLODMjJ0WjzFJpNLKJiNkDrnFRW/CCvYMgJEzL+qkZOkteO9eA3X5swG3BfiW9LgeeqdRo/NsYE3W/2w=
X-Received: by 2002:a17:906:4fce:b0:780:e1d8:eacc with SMTP id
 i14-20020a1709064fce00b00780e1d8eaccmr15423597ejw.366.1663756550698; Wed, 21
 Sep 2022 03:35:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 21 Sep 2022 16:05:39 +0530
Message-ID: <CA+G9fYsZ_qypa=jHY_dJ=tqX4515+qrV9n2SWXVDHve826nF7Q@mail.gmail.com>
Subject: drivers/net/wireless/ath/ath11k/mac.c:2238:29: warning:
 'ath11k_peer_assoc_h_he_limit' reading 16 bytes from a region of size 0
To: Netdev <netdev@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	linux-wireless@vger.kernel.org
Cc: Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	ath11k@lists.infradead.org, regressions@lists.linux.dev, 
	lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"

Following build warnings noticed while building arm64 on Linux next-20220921

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

In function 'ath11k_peer_assoc_h_he',
    inlined from 'ath11k_peer_assoc_prepare' at
drivers/net/wireless/ath/ath11k/mac.c:2662:2:
drivers/net/wireless/ath/ath11k/mac.c:2238:29: warning:
'ath11k_peer_assoc_h_he_limit' reading 16 bytes from a region of size
0 [-Wstringop-overread]
 2238 |                         v = ath11k_peer_assoc_h_he_limit(v,
he_mcs_mask);
      |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/wireless/ath/ath11k/mac.c: In function 'ath11k_peer_assoc_prepare':
drivers/net/wireless/ath/ath11k/mac.c:2238:29: note: referencing
argument 2 of type 'const u16 *' {aka 'const short unsigned int *'}
drivers/net/wireless/ath/ath11k/mac.c:2019:12: note: in a call to
function 'ath11k_peer_assoc_h_he_limit'
 2019 | static u16 ath11k_peer_assoc_h_he_limit(u16 tx_mcs_set,
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
In function 'ath11k_peer_assoc_h_he',
    inlined from 'ath11k_peer_assoc_prepare' at
drivers/net/wireless/ath/ath11k/mac.c:2662:2:
drivers/net/wireless/ath/ath11k/mac.c:2251:21: warning:
'ath11k_peer_assoc_h_he_limit' reading 16 bytes from a region of size
0 [-Wstringop-overread]
 2251 |                 v = ath11k_peer_assoc_h_he_limit(v, he_mcs_mask);
      |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/wireless/ath/ath11k/mac.c: In function 'ath11k_peer_assoc_prepare':
drivers/net/wireless/ath/ath11k/mac.c:2251:21: note: referencing
argument 2 of type 'const u16 *' {aka 'const short unsigned int *'}
drivers/net/wireless/ath/ath11k/mac.c:2019:12: note: in a call to
function 'ath11k_peer_assoc_h_he_limit'
 2019 | static u16 ath11k_peer_assoc_h_he_limit(u16 tx_mcs_set,
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
In function 'ath11k_peer_assoc_h_he',
    inlined from 'ath11k_peer_assoc_prepare' at
drivers/net/wireless/ath/ath11k/mac.c:2662:2:
drivers/net/wireless/ath/ath11k/mac.c:2264:21: warning:
'ath11k_peer_assoc_h_he_limit' reading 16 bytes from a region of size
0 [-Wstringop-overread]
 2264 |                 v = ath11k_peer_assoc_h_he_limit(v, he_mcs_mask);
      |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/wireless/ath/ath11k/mac.c: In function 'ath11k_peer_assoc_prepare':
drivers/net/wireless/ath/ath11k/mac.c:2264:21: note: referencing
argument 2 of type 'const u16 *' {aka 'const short unsigned int *'}
drivers/net/wireless/ath/ath11k/mac.c:2019:12: note: in a call to
function 'ath11k_peer_assoc_h_he_limit'
 2019 | static u16 ath11k_peer_assoc_h_he_limit(u16 tx_mcs_set,
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
In function 'ath11k_peer_assoc_h_he',
    inlined from 'ath11k_peer_assoc_prepare' at
drivers/net/wireless/ath/ath11k/mac.c:2662:2:
drivers/net/wireless/ath/ath11k/mac.c:2264:21: warning:
'ath11k_peer_assoc_h_he_limit' reading 16 bytes from a region of size
0 [-Wstringop-overread]
 2264 |                 v = ath11k_peer_assoc_h_he_limit(v, he_mcs_mask);
      |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/wireless/ath/ath11k/mac.c: In function 'ath11k_peer_assoc_prepare':
drivers/net/wireless/ath/ath11k/mac.c:2264:21: note: referencing
argument 2 of type 'const u16 *' {aka 'const short unsigned int *'}
drivers/net/wireless/ath/ath11k/mac.c:2019:12: note: in a call to
function 'ath11k_peer_assoc_h_he_limit'
 2019 | static u16 ath11k_peer_assoc_h_he_limit(u16 tx_mcs_set,
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
In function 'ath11k_peer_assoc_h_he',
    inlined from 'ath11k_peer_assoc_prepare' at
drivers/net/wireless/ath/ath11k/mac.c:2662:2:
drivers/net/wireless/ath/ath11k/mac.c:2264:21: warning:
'ath11k_peer_assoc_h_he_limit' reading 16 bytes from a region of size
0 [-Wstringop-overread]
 2264 |                 v = ath11k_peer_assoc_h_he_limit(v, he_mcs_mask);
      |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/wireless/ath/ath11k/mac.c: In function 'ath11k_peer_assoc_prepare':
drivers/net/wireless/ath/ath11k/mac.c:2264:21: note: referencing
argument 2 of type 'const u16 *' {aka 'const short unsigned int *'}
drivers/net/wireless/ath/ath11k/mac.c:2019:12: note: in a call to
function 'ath11k_peer_assoc_h_he_limit'
 2019 | static u16 ath11k_peer_assoc_h_he_limit(u16 tx_mcs_set,
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
In function 'ath11k_peer_assoc_h_he',
    inlined from 'ath11k_peer_assoc_prepare' at
drivers/net/wireless/ath/ath11k/mac.c:2662:2:
drivers/net/wireless/ath/ath11k/mac.c:2251:21: warning:
'ath11k_peer_assoc_h_he_limit' reading 16 bytes from a region of size
0 [-Wstringop-overread]
 2251 |                 v = ath11k_peer_assoc_h_he_limit(v, he_mcs_mask);
      |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/wireless/ath/ath11k/mac.c: In function 'ath11k_peer_assoc_prepare':
drivers/net/wireless/ath/ath11k/mac.c:2251:21: note: referencing
argument 2 of type 'const u16 *' {aka 'const short unsigned int *'}
drivers/net/wireless/ath/ath11k/mac.c:2019:12: note: in a call to
function 'ath11k_peer_assoc_h_he_limit'
 2019 | static u16 ath11k_peer_assoc_h_he_limit(u16 tx_mcs_set,
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

Build log: https://builds.tuxbuild.com/2F4W7nZHNx3T88RB0gaCZ9hBX6c/

--
Linaro LKFT
https://lkft.linaro.org
