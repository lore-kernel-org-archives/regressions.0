Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8B21E3DED
	for <regressions@lists.linux.dev>; Tue, 29 Jul 2025 20:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753822749; cv=none; b=ryKup29TUZ6VzFtxfQD03ZDM4V0ju0/SozPtPj9b3KV02pNuW7WJtrF+CsXT3DLZ9ROKokvXkUFLpFJ3FAtiKtwL5Hn9mRI13eOLViYF6sKpWcFecK5kHbjca52No/k7vnAa78C5Un3E9vEk1S3FEhdkcdEqNefAwO22wk4hZAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753822749; c=relaxed/simple;
	bh=SBQJvC0CgAhXNHGcvYtugdc/MiwoIR5YSKkkakbBEIU=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=ELAb5+mU+yfiDQml62Ktk79xWA941Y7weFOKvCYlzk0amDHxTTdwY2sycYg183cSlmzzYmBpVrtFl8KW33G5fGuPNJUjU4JsIY/CapQIO+PhLmQqGjLcfrD580Xy/0D0/WQqjvoRlTC9iTW9j0XeooGYO18n5/7C7CMChnubA0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=3f106qRa; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="3f106qRa"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-75001b1bd76so3918980b3a.2
        for <regressions@lists.linux.dev>; Tue, 29 Jul 2025 13:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1753822745; x=1754427545; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wt2a0QlM6Zt9QiQ9AIc7GPQmx4pHLeEdOyNOf62hfdw=;
        b=3f106qRakIQt5XOzHhtxhbeiJBcNKr2fYtJSgRGm3zHa+BpOkw47XV4TtnX5UwUh7d
         w8xQ2pOdDfyk9jNK9/PULcJxudbXoyStoSe8dQ4qitb0FD5iZE2aaUXMRlN/7aSJ/+e2
         fl7S7NOGsLRMqvJ3QudtZpi/pFc2pgzLvtQgSYNL/yV4H5ibRSOEBxBPp0Mbnjfyx6gT
         2IgbZAcTcxnPHSwaSElnYH58AG54rhsHkx5qSNs/dxvTHf2gBjkG50MLxPn4dKYhHvj/
         vL2L/0bDXhkuf62d5+7G9cD+yGxvvVSHj4L1J3Bf3vE+4ODbEpKnuySCNhvTWGzkQI4W
         ntMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753822745; x=1754427545;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Wt2a0QlM6Zt9QiQ9AIc7GPQmx4pHLeEdOyNOf62hfdw=;
        b=TYkColWoZ9iz/A8kmfP0vohq0yapvMXqoDmpnFZKELdKyT/KBtXDtLglmcjA0GZSI2
         P4z49st4qYzq3siTYzYj0l7onWF0NZQzQqSscI/2PWLqEt2jF21/URnQu6hKj3fnhkJ4
         n6t4QY0jIrl3jsSZ4otPCbFDqQJ8JNWc1LrG+XEg5EATPqD+buCy63nZWRa2v0/f2tYW
         2VZA+Tqrr1Iw7Db4yOHJSDfSdoTYSJ/AblrVJyxGvKWirrEQ2IieU8e3iOD8YYUutodY
         9GgJ3HCoVO6JjplcQrfv3v4RsGzAkCyf0AH0YWXBqyul2rUOSa+2vLD64JCSz8zXOF8h
         kCUQ==
X-Gm-Message-State: AOJu0YxtZeW0dEU/SeCTBITX4AO3UKMoV+n96+GS8F9QcyM9DpLjczxP
	FFczacdo3is6mLEFh5fCN3uikqn2dC8i7IIU+/4+SrCevV3soIVTx162NPEHBQXhZlM=
X-Gm-Gg: ASbGnct4Ta9Fg6vRU4xyOZgD5UUfYCXryljSm6d6lvjgvxoeklZIRem4tSZTgfY+T/C
	PVM6JulDAb9RW5CI8/r5/QFVJaZN/4741EGZJQK6PvjKsMl7TsWLbjg/tu4k3+OpYp8YTR0Yvr0
	fcKFNTucJqLYTpUwY2rQJlFmcS2XzSGNdYTp5ovISYXLGYnu/g4UpijMbgWF3p9H1h0oGZ+G1B6
	gWPahXPWEiL8UfuuT0RnvgI2kDHMQOk9PR4cqv0eeujw3nKozEN6dQp2KFBP/vwIZMwnEcPgoiK
	V6uTagQiagL/VY6xHhrhZ70Bg7NalCxySVuQDxorTMKi+IvOwUOprWO08dXPgIg9H/MknY/0roh
	wAIy0Ft4uP1H/XEL8
X-Google-Smtp-Source: AGHT+IELdM0RJ/PquVneogIU/YCRmeJnfwfqXZdqAIBCvS/8Ny+zKukpoBtEmCwTfVhlqRtgZ8Sg+A==
X-Received: by 2002:a05:6a20:729c:b0:239:eed:43a6 with SMTP id adf61e73a8af0-23dc0e443d0mr1176734637.22.1753822745415;
        Tue, 29 Jul 2025 13:59:05 -0700 (PDT)
Received: from 508e4dbc6f9f ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f7f568a3asm7803021a12.6.2025.07.29.13.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 13:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] mainline/master: (build) clang: error: linker command
 failed with
 exit code 1 (use -v to se...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, laura.nao@collabora.com,
 shreeya.patel@collabora.com, broonie@kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 29 Jul 2025 20:59:04 -0000
Message-ID: <175382274410.74.14508795306480280784@508e4dbc6f9f>





Hello,

New build issue found on mainline/master:

---
 clang: error: linker command failed with exit code 1 (use -v to see invocation) in /tmp/kci/linux/tools/testing/selftests/exec/load_address.static.0x1000 (Makefile:46) [logspec:kbuild,kbuild.other]
---

- dashboard: https://d.kernelci.org/i/maestro:9f62126602458a4234fed52f1605db5e17457615
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
- commit HEAD:  0919a5b3b11c699d23bc528df5709f2e3213f6a9



Log excerpt:
=====================================================
/usr/bin/arm-linux-gnueabihf-ld: cannot find rcrt1.o: No such file or directory
clang: error: linker command failed with exit code 1 (use -v to see invocation)
make[3]: Leaving directory '/tmp/kci/linux/tools/testing/selftests/exec'

=====================================================


# Builds where the incident occurred:

## defconfig+allmodconfig+CONFIG_FRAME_WARN=2048 on (arm):
- compiler: clang-17
- dashboard: https://d.kernelci.org/build/maestro:68892219759fd8fd443064f4


#kernelci issue maestro:9f62126602458a4234fed52f1605db5e17457615

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
