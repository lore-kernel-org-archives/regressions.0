Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D5B2F7443
	for <regressions@lists.linux.dev>; Wed, 22 Oct 2025 15:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761145656; cv=none; b=izcpJIRfMQy9YyhvutCPgn9Ixipr0UoZNjqz7ZP3exHCLXkUPBUxcVlaLaix0cQcj5bnoJoFfLSy2oID3yLdrDBkOCpWzD+JoZfqEnX3K4Doyv/jMTRqXPjZk5cJNRIeRhz03osxFqLcBlvjApR170N2XzQWBjHmN1IExxJYN2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761145656; c=relaxed/simple;
	bh=laoIWGu4p0dTammd2Nay5qWKbVIQdGqiuFOD52Zityg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PbflYsmSp3FtnRC38DhZQGoXruMgAtj1xDUAMpJDC/pN4FQBPl8G4dNW0feTXLzA6/YRtFkopdwU4HbPi6u8sGqCyym7soqV88GzpEhlEijhabquCqJM0Z1ziIzsnevJi+Ee+5w+1UUj5RSQOtib/vwjXT9q9mrFtJ/NePyHSa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lzs0tQiB; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lzs0tQiB"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-87dfba1b278so7496196d6.1
        for <regressions@lists.linux.dev>; Wed, 22 Oct 2025 08:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761145654; x=1761750454; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LwzTm8USs1oolFR4WnnlWLIHx/1z1zWMBPnOEps6YoA=;
        b=Lzs0tQiB6BR/vtnWE1iI4JbCwsJv/ViaaJ2HOiPCn8ksB/nj1ZAB9DyaUhoVSmieKi
         7I32ucM0nGUXs3vdmfRYO8AAnE9HI+NfJbzFRh1Z5wwDzWxC8Fh7cG+kMvnz+bdpF6B4
         sdmBLQET55vrlrok8gVzuTKBKH4TrM5IFivTb7mG+IZFFoxgRdleZbte2H0mmO52JsXM
         j50Kg5YmRj4QeYB1bXEQdHOSPOKyFj51JzTyQ4EF3Tg67/ozpJ5cGAEpgBe/hlnQJIqH
         S6n1lsxh3SV02OpXBVqLDW1p/EAlrg22fbULqiAc9V0dwx0L1Kua5ILtHcTLx9LZ3oHq
         RGLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761145654; x=1761750454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LwzTm8USs1oolFR4WnnlWLIHx/1z1zWMBPnOEps6YoA=;
        b=AVnrW5mm7GUXOp4vCm9J8XwoyxQHrX2ShVqD+psCV3oa8//Jd8awVmNRqEXGch5be4
         SWwAGy1MrPRWTLTa0TiB/j+9VU6OsXtZcrzzvvWmSOpM7Z45Ma1mclxQSI6oBlkBs+KF
         UQHUVDEVywmZm7z+dYpM63Qh1beklv31FxqADb3wQoFDFwq5QJyY02XRVjGJo97u1J14
         CI5dwVwkPRf4vEeYslO0qep7hnitmuoGFEnmeRPUULjZWTUBzFzCgbCCdmc9P9QelRMy
         tLijo7n8S+hxpEnyOwgouQehwWP7eMo+aewlFhe2PnZ/h+cdvcPy/kJxmDRON/ZxrZs/
         kfhg==
X-Forwarded-Encrypted: i=1; AJvYcCUopB30VAJrW/The07P4YcM8bOjMWVrcNIV3OJdv5GmA1JzHwgtNhLFekuC7KbvcYkBb55Oh8ShPYtNZg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzbeeDo1E7x6eCyazpJHxnCX5cnDDYii1q5t1AsaCjA4PwUD5Lo
	FGSSxs6gpmsioX3tYt7hel118DvEmYfXhCzXkEsG2uzmBGbdid0vBMYd
X-Gm-Gg: ASbGnct+M8tMFo9nwE9KRRl70Ub5vx1iPoInbALO4VSaYGq5YqOlT1bKAXjkeqSxs1W
	9bIHa0x27PMC4x1T5mONPBhrKXkIJP+zjDjPCNvIUsKAEVNlVXKXKi2SYTXBihBR3cxRiU46pNB
	+nanFUCZjluBOBXI+PhlBxONBp5bRsHAbNzIbxiMHRuTkMlXIIMLtg5c+JQlFVOVUH5zSNI/9O7
	s3CS5llo5NPOzzs0cGGCAO5LjUGkbOKc59gdcgte9tdBZ78qnjyo0lBKXlr6YcTjIc42j8//UiG
	yrSgoyX8NjmfgODXSMnPpSEE1t7Jlo+iVCzYUEts/bmzsFaHhclqz3Yw6VuqYFcl5DDSwoX+tkb
	J4D6RB+uYZVEcXhVB+e6JUi0GaP5Bey2TUezzGc/uxkhAu05memiqkRXWiRBZwYicjlHOxHneUS
	gedMw0XuOMjKKXr7Zy9/qeg0C77irhiMDV/C9INSMsknRzCz+Wdo3OStWvDhpn3qwjsOTnBWeC9
	3mZU2Q+sXVbzHhmKko9uCCPp+rnJf32vAJAYsr+AUz0dkReJsgOY7D6oos3ySB1aQKrAmKk
X-Google-Smtp-Source: AGHT+IHsEoy9TxGzvUXGFHK7BCWyNK142Lft2EHU0bFZvJFw5sqf9x3YTrPE8ZGiTyyaXtUe0r/i+Q==
X-Received: by 2002:a05:6214:21e7:b0:7fa:3202:5261 with SMTP id 6a1803df08f44-87c20543291mr269537286d6.12.1761145653653;
        Wed, 22 Oct 2025 08:07:33 -0700 (PDT)
Received: from NEU1-L01066-Ubuntu-22.04-valeo-wsl2.vnet.valeo.com (ip1f10fd85.dynamic.kabel-deutschland.de. [31.16.253.133])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87cf521c2c7sm89448266d6.19.2025.10.22.08.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 08:07:33 -0700 (PDT)
From: Mallikarjun Thammanavar <mallikarjunst09@gmail.com>
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	Mallikarjun Thammanavar <mallikarjunst09@gmail.com>,
	"kernelci . org bot" <bot@kernelci.org>
Subject: [PATCH] io_uring: initialize vairable "sqe" to silence build warning
Date: Wed, 22 Oct 2025 17:07:16 +0200
Message-Id: <20251022150716.2157854-1-mallikarjunst09@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

clang-17 compiler throws build error when [-Werror,-Wuninitialized] are enabled
error: variable 'sqe' is uninitialized when used here [-Werror,-Wuninitialized]

Initialize struct io_uring_sqe *sqe = NULL; to have clean build
Reported-by: kernelci.org bot <bot@kernelci.org>
Link: https://lore.kernel.org/regressions/176110914348.5309.724397608932251368@15dd6324cc71/

Signed-off-by: Mallikarjun Thammanavar <mallikarjunst09@gmail.com>
---
 io_uring/fdinfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/io_uring/fdinfo.c b/io_uring/fdinfo.c
index d5aa64203de5..e5792b794f8b 100644
--- a/io_uring/fdinfo.c
+++ b/io_uring/fdinfo.c
@@ -89,7 +89,7 @@ static void __io_uring_show_fdinfo(struct io_ring_ctx *ctx, struct seq_file *m)
 	seq_printf(m, "CachedCqTail:\t%u\n", data_race(ctx->cached_cq_tail));
 	seq_printf(m, "SQEs:\t%u\n", sq_tail - sq_head);
 	while (sq_head < sq_tail) {
-		struct io_uring_sqe *sqe;
+		struct io_uring_sqe *sqe = NULL;
 		unsigned int sq_idx;
 		bool sqe128 = false;
 		u8 opcode;
-- 
2.34.1

