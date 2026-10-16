Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D0533D6F9
	for <regressions@lists.linux.dev>; Fri, 16 Oct 2026 13:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792156841; cv=none; b=a4wKzamV4v6vfsaM3w0xTLIlq9oLFR1cAXOuTI0cma64yTpf0uN6cpBLYZtaJP1RL8GeunMwXirDeHNtsCzw8MNNr82p2YJ86+x5hgT+H4IcUFa4r/vGFeDzAlRuvF34eid40lRNxoV0mX8m50xL8NJLes6/a4iMJMASadhy+xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792156841; c=relaxed/simple;
	bh=8LZRcG4RAXDCcewy5ZGkTw4K/dxAa6eoPk3+1qnhNgs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GcMGIN+yB5TYS5PJQDbr22ji3nH7HAscwjRnzTS0TQNyefo6K4ujBUPOCIRERYyYfCuQ6BybJwfOkvTaa1lxdwy+gFz2IAUXQ0018fgY83NKr8+HRS795XtOMVg/m9EUxJKcDTHHdrc0odA5+6NhKaNlkpy4artIPo2VlhgTf4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UMBj+PUF; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UMBj+PUF"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc4b1f7e8f4so4033863a12.1
        for <regressions@lists.linux.dev>; Fri, 16 Oct 2026 06:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792156839; x=1792761639; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8LZRcG4RAXDCcewy5ZGkTw4K/dxAa6eoPk3+1qnhNgs=;
        b=UMBj+PUFlzcoFNtcXIltCzJSZuSrAT76CAtpJ2WexxZFQIg15onCT8kK3555PNjUyK
         Ya99Ykn3/psfeKp5gRv+G1qp1sgTm3+eV+ZeUCc2wadSjGt9ytI6Zo31CRD7iKjKM6l9
         qXT1nMCUmjh2krEuAxjlFL4nZmumdSNPRz8iNq+Mvsp+dZ5K5N8MVgOyPZ3J2n3uUd1q
         3fWkfcWEMeHWqOqMIPcak56Lhiura27atSMbQcuOdf1K/+/SAMcsJNlvEXYoOLv1exs5
         93gGysyqD5VDYLUpwVhqrb8iGSLNtQ3iH/pTzFEhovZvOOpqgRRTy8mPi2iOVaYXXRpP
         0XFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792156839; x=1792761639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8LZRcG4RAXDCcewy5ZGkTw4K/dxAa6eoPk3+1qnhNgs=;
        b=gFta9q5y6A0+smoBIymQ6NNuGaVMLA3dpNK/mi/dSlriWoVJKCZ9QgC/YeT49wXvOo
         IkrHxYS8HpnB++9r1VMzS7pYV/x+yri9n8YAXaOEGwMQMFLWsVSGawlpZCLkTikfWvbc
         mrRj/PMxXNiyY6Hl6n8tmPSAH8wd4/pJ+NRa9yMGDubQISHG+Opjy6JxpXZ1JutjS/cS
         yZ3lPLZkGMKdAWIN3J5ZCFC9yoA+XjRAc7B1HXLKjulIXug6hKsJ1e/L5SKs9rEdowxe
         fkgl1UBUsglzLTsQhm6JxEt+bNZoIHDCrCjlZeFtKfDkFzkFt5vSmgzHDoJQ9QjkrCt6
         GoHg==
X-Forwarded-Encrypted: i=1; AKwUvBymG55jAQBfiZtlBxlA9vPyp0On7UZHxwwcJY4zr1W4bE+uNM6iJl7MxtMIhrA39+eUSzop+85ETmcWAA==@lists.linux.dev
X-Gm-Message-State: AFq9FYJaFrjfLdSMDCpsvR1kkSu529bOWcMiWM/cQbGK/0twEVHBmRj7
	OIfqLzRT9Un7wVvFg+9B3DVeLeo2Ex+qaoFrwxa6RXx0cs8XgVNaLJTc
X-Gm-Gg: AYBFou1c9s//ajV9mLGxfqXV++z/2PE35lNOXE5d7SsCUkK+ANU+FGE0rtmqpCgUQoH
	wdthLVjztxHR4uvy3KHCwHmIlCYIelWdWO1vt+bPlzVHtev8P5R5mEhvtxE+3UVKt/VKEGAbBSq
	5Wjkp2qfUzjrvE2z89aOk/qpMM4LB9UAYKnHy20nI+DWlxZ24ZBloo13YYK5Y++qno1fGGC4qJN
	lXSFVnt7YdZeA6Z/lV5MfhnblpPLb2YkbXMd05zPQkpBVDH0RpwENzx9Rs9eQJJtglOM8S5hu89
	n5cKJBls660+zy81xNiAuWtIWiATJgByQszCAFt09Mfo4azB7fMbl+588WNlUk539mEV6kjZ9s4
	JIMX8VbqiWvJgzkIpqnWq/yGrsW6JlQNsE/TEKaLVjLM9K8NTzDvG4c6kKp7EvQ4z3PSEx85M7v
	XYaDWW3CMVrfj94Jaej31aBfx8GKp+cTE036YiW9lyBa0ct7ZnCmq6g/oKbWEEQL4yw0FXic2L8
	uTDAll0mm5frg==
X-Received: by 2002:a17:902:ea0a:b0:2e9:492e:1688 with SMTP id d9443c01a7336-2e9492e1786mr75900865ad.8.1792156839354;
        Fri, 16 Oct 2026 06:20:39 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8997edsm10013245ad.63.2026.10.16.06.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 06:20:38 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: mani@kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	christopher.lew@oss.qualcomm.com,
	deepak.singh@oss.qualcomm.com,
	pranav.phansalkar@oss.qualcomm.com,
	andersson@kernel.org,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH net] net: qrtr: ns: retry service announcements on -EAGAIN
Date: Fri, 16 Oct 2026 22:20:33 +0900
Message-ID: <20261016132034.711-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <bbdaabf7-ffdb-433d-91fb-f6ca03b0747c@oss.qualcomm.com>
References: <20261016124600.31-1-26rote@gmail.com> <bbdaabf7-ffdb-433d-91fb-f6ca03b0747c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 10/16/26 3:14 PM, Konrad Dybcio wrote:
> Please remember about Assisted-by tags if they apply in your case

It does apply: I used an LLM for the analysis and for writing the
patch. I left the tag off after "docs: remove Assisted-by references"
was queued in docs-next, but I can add it back in v2 or note it below
the "---", whichever you prefer.

Thanks,
Joonhoe Kim
