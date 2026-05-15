Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CAD40B6F3
	for <regressions@lists.linux.dev>; Fri, 15 May 2026 08:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778835548; cv=none; b=IbQx/NWRPYFkknoJViLoYC4TjU4RkB5iHQHVoqA9fLIjPJDayWmEfdFVgwq4Jy8yXO2Y9fNUs/g7i2twRiLfu1DtmoYVmrORgyN+Y5pkEAjT/Xs7Zlm9FsWmHrs1o4eYP1FldXi2N3TfWEd5e00jqhrOey93WVaGSaLP2eIdtS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778835548; c=relaxed/simple;
	bh=BT+4lpqZRbSwNOvxlQYruw1zhvM/zbwBLoUgq6GCQBU=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=KGK7Su4XcooKeBLrpIzhDpju9ryhdw5PCpG9dU4sUY+ThxCeWOw3BcB8+AoQyWnJsnp/RnzTJFCovx7xII14vpZK3MWTGuUhKbDuGmg5ARXMIBtl0GY25bjqWHMA+bmFXnL+nL/iAkrwS7HIX0W0uljZZi1NaVL8mBHEOBAjfag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=C1S7mGCf; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="C1S7mGCf"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2c15849aa2cso12157324eec.0
        for <regressions@lists.linux.dev>; Fri, 15 May 2026 01:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1778835546; x=1779440346; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=caE4sK84bQ2Z+itYTqOqWMAyp1aXOUT2/Er1oZIv61c=;
        b=C1S7mGCfJ2hVdjqFuQEsxtcmW6AnrATKKuH5lEoM4RPaDt8QlDzz81s8lBYHgu9kFa
         CCdzR+NImroWUxYSOafH/IBfIe69WkwtH7ZLmQbaJmCb5WcpgFVk1IGFe/kbpCJY53n0
         P2yVp+zxJLlFXlkalk4/mz3wa292CDvOcd8tbePZJg1/dRdBTIgHBiNLdp415tFSXqIo
         L9263sPiirTccyYHRGww7gBPQ+y0DBW4jHcjs0eGtrKJkyMdcNbS4ReDqbEpRZOCR1WE
         +tejQxby6HTONnMolC0f16hbH2IcDtPCkkrpZ2RperIth9U6cJ/QTq6Ho1WSQODdcT1T
         CWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835546; x=1779440346;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=caE4sK84bQ2Z+itYTqOqWMAyp1aXOUT2/Er1oZIv61c=;
        b=BpnzzPFLqWSLBwtSqa0Kp5K11uyEBZHVeG3U8NtH+YXjpeF1fszNJzyswy+nsd8Qfl
         F4BVchUOfRcwuosfVzKRfbmiIUD2dcSX1WlvzFdGiduRWRGHyt6HeSI7I1ow+dzJ4g4U
         EGmVGjJ/pQePAnDoTBl+piqBCLIc1K6P4Y3b7avAyR59aGa1as8ySmTOxME8GOixUQhP
         T9IJTDLrkGkwv4zXB452mNr8/PddWsqbJxtIiZigEoceEE1Qf/L4hm228Q9Wni7eepwe
         g77ZhfT+0Ly19q71UM9Dce3yEi+xRM3HNy+e/PypWaLzliLvPedR9wyEkj1OYWhDFo8o
         oD4A==
X-Gm-Message-State: AOJu0YwF8XXjPp88IoPWHkLrMa7ywmEep7CqPWFeCsS674jEdAUbsB3b
	UOXwT4rlWGKPGbcjPm0x/euzwbicKKaB6dX3ewCBFfcDcbmxOGr3XqjXNlCG417leUcEfv3Wx/y
	w+O4e
X-Gm-Gg: Acq92OGiVitT5k/W5o1VzTrktGjdQXoB5edcmLOab2K6KiIk0+HnY8zizuy7UF/EwfW
	0kgUJZlskrWg8SeWH/iWI/UcmyBFjkY8NGlzDfpEp304ru6T9v22wVc/dSjUaps1J//2aiRJ5yt
	kEsjytECzZwttjnnoYI7Xcswxf9RgTX19dUaHxi4aYlQcdqp/I5wAwDvQ06y8O7LGj98FccCBgD
	4X+GKeLVVTehdjD12YE3IvXfPeT6scytdzcrYPhj6sGqyIMFyc70Tp9dmYJsFs/I/cF0MEwSxd6
	fYpPSVO2tecii/6xcN8o+MpYbfW1kShbmoC4Gx2fjwn0cRhyusIMC7friKJZecVy2HJzDxLkpEg
	NIe7TaC0j33O48YJPbCrzsk6B/xhu7O5oANVsxEzceL48YjK4tATrGVMedyNAbdhKjJQZruDzhE
	0DSq9ovh9sQ9utbdos
X-Received: by 2002:a05:7300:dc03:b0:2ee:be86:7b90 with SMTP id 5a478bee46e88-303986b1538mr1391087eec.29.1778835545848;
        Fri, 15 May 2026 01:59:05 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30296dcb6f6sm7262374eec.17.2026.05.15.01.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 01:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] mainline/master: (build) format specifies type 'long'
 but the
 argument has type 'size_t' (a...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, laura.nao@collabora.com,
 shreeya.patel@collabora.com, broonie@kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 15 May 2026 08:59:04 -0000
Message-ID: <177883554431.890.896648059104722532@330cfa3079ca>





Hello,

New build issue found on mainline/master:

---
 format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Werror,-Wformat] in drivers/hid/hid-core.o (drivers/hid/hid-core.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:6790c78db860b3d911e9ad88aac9854e2ed77dc5
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
- commit HEAD:  70eda68668d1476b459b64e69b8f36659fa9dfa8


Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
/tmp/kci/linux/drivers/hid/hid-core.c:2054:29: error: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Werror,-Wformat]
 2053 |                 hid_warn_ratelimited(hid, "Event data for report %d is incorrect (%d vs %ld)\n",
      |                                                                                         ~~~
      |                                                                                         %zu
 2054 |                                      report->id, csize, bsize);
      |                                                         ^~~~~
/tmp/kci/linux/include/linux/hid.h:1342:43: note: expanded from macro 'hid_warn_ratelimited'
 1342 |         dev_warn_ratelimited(&(hid)->dev, fmt, ##__VA_ARGS__)
      |                                           ~~~    ^~~~~~~~~~~
/tmp/kci/linux/include/linux/dev_printk.h:227:46: note: expanded from macro 'dev_warn_ratelimited'
  227 |         dev_level_ratelimited(dev_warn, dev, fmt, ##__VA_ARGS__)
      |                                              ~~~    ^~~~~~~~~~~
/tmp/kci/linux/include/linux/dev_printk.h:215:25: note: expanded from macro 'dev_level_ratelimited'
  215 |                 dev_level(dev, fmt, ##__VA_ARGS__);                     \
      |                                ~~~    ^~~~~~~~~~~
/tmp/kci/linux/include/linux/dev_printk.h:156:70: note: expanded from macro 'dev_warn'
  156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
      |                                                                     ~~~     ^~~~~~~~~~~
/tmp/kci/linux/include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
  110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
      |                              ~~~    ^~~~~~~~~~~
/tmp/kci/linux/drivers/hid/hid-core.c:2076:29: error: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Werror,-Wformat]
 2075 |                 hid_warn_ratelimited(hid, "Event data for report %d was too short (%d vs %ld)\n",
      |                                                                                          ~~~
      |                                                                                          %zu
 2076 |                                      report->id, rsize, bsize);
      |                                                         ^~~~~
/tmp/kci/linux/include/linux/hid.h:1342:43: note: expanded from macro 'hid_warn_ratelimited'
 1342 |         dev_warn_ratelimited(&(hid)->dev, fmt, ##__VA_ARGS__)
      |                                           ~~~    ^~~~~~~~~~~
/tmp/kci/linux/include/linux/dev_printk.h:227:46: note: expanded from macro 'dev_warn_ratelimited'
  227 |         dev_level_ratelimited(dev_warn, dev, fmt, ##__VA_ARGS__)
      |                                              ~~~    ^~~~~~~~~~~
/tmp/kci/linux/include/linux/dev_printk.h:215:25: note: expanded from macro 'dev_level_ratelimited'
  215 |                 dev_level(dev, fmt, ##__VA_ARGS__);                     \
      |                                ~~~    ^~~~~~~~~~~
/tmp/kci/linux/include/linux/dev_printk.h:156:70: note: expanded from macro 'dev_warn'
  156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
      |                                                                     ~~~     ^~~~~~~~~~~
/tmp/kci/linux/include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
  110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
      |                              ~~~    ^~~~~~~~~~~
2 errors generated.

=====================================================


# Builds where the incident occurred:

## defconfig+allmodconfig+CONFIG_FRAME_WARN=2048 on (arm):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a068eb70ed99f002e8a9e67

## i386_defconfig+allmodconfig+CONFIG_FRAME_WARN=2048 on (i386):
- compiler: clang-21
- config: https://files.kernelci.org/kbuild-clang-21-i386-allmodconfig-6a068f340ed99f002e8a9f07/.config
- dashboard: https://d.kernelci.org/build/maestro:6a068f340ed99f002e8a9f07


#kernelci issue maestro:6790c78db860b3d911e9ad88aac9854e2ed77dc5

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
