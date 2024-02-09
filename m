Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1527AE51
	for <regressions@lists.linux.dev>; Fri,  9 Feb 2024 16:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707496502; cv=none; b=ayopahdwDQ8YFIMjpkf27i9rM9vVi+Kz9YNGYHRXxDwk9Ljo1a6+MMM5ByvuNEOXmXGyCqOsdHXaZMOgYO1LUr0Fa8NwYEqVezu/zOfm3V6eeIKE76Xg5WKxXwv81BHKrxul1ksUGc9i6dgyy5zDs0mTKLXjQIg69GNwgetqnCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707496502; c=relaxed/simple;
	bh=GT3d5XGcWkiMb3Qfy3MdLpMBKnEs3nWCkb7dD+ADAI4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=P2nsXbtgGSz2QGIUT7t0LLmTNMVaJiD+T5I0Jqhf37VOr1BakMmBbs+aFEUlYL7JlVQb02LqfJOReaZG9gJtvOIND8kfbHrfNEauk+3RfdFXTvAL5m2uob84OaovU3c/3L4dIuZ+5+snwECTJYayJP6urxq1wZmy1RACt/lwFDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JVWV5q0Z; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JVWV5q0Z"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a3bf9012637so88652666b.1
        for <regressions@lists.linux.dev>; Fri, 09 Feb 2024 08:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707496497; x=1708101297; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2hcO1Laq6zZPmAfJxAD7/PlDw25+j7/RrLike+pBwtg=;
        b=JVWV5q0Z4GQ68zkadFGxluYVMWDuyW/T/MFza7sjyaIehPcs5LIiQTYo7GByD7Bx1U
         Y827mQSeH0KKA6gzURYISSpQSdJJEXmsnSQ+02mmsfu5qxlnb6o8JvNpfWiejRxDOeG0
         ALyWmLkCwmqJAL1J3a/nepMrhblLm3zoub4Z7W9vNFZviJqrjbfkOfTcRjygWyzRhzcA
         4o1KLBOjZgVfCZZkbrPbGZTid9ncck5L37UBjiXeLq1TNhuS2+9f+Lithmf2l9jvkZ/Q
         CUgq5hHsJZqEkWKtEpSwaMmGz5j0tvxYFKonqfXL60GaqIcOZIgzzmHw+LHtLpAYnPh2
         1RBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707496497; x=1708101297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2hcO1Laq6zZPmAfJxAD7/PlDw25+j7/RrLike+pBwtg=;
        b=Otatk3Bbli9vW4nUItTdd80IvojxnsMjT2DlRqA64zWCbnct9004dcN59TYaa5DTFF
         oAz73sEwG1Nu/Bk5bZJWiTmk5XWdsimj8Wh/w1ztkXQVEvAIM00Ks04kh9qqJqz3cb9M
         oIyuJNq+U0l2IVzpEg52es6RQeQhAqpIfAf/6AXvnx/DRtV8PQwtYUwfpK4K4eOOkWDo
         5j0fyp/onC5pOqWwEY5iKBvMXvnxj7TlUrnkWcXkWS5e3UsISExBX5n3gzE5idY9BJNG
         6An0TE0YuKZog/+uK2yah/wfvZLA1Dq/jvnAN4n3k8aw8NUd40Tn9C5bAhPA2HhHy+kJ
         JC2g==
X-Forwarded-Encrypted: i=1; AJvYcCUKC2uumNhdFvavL1nnc9vVc/b6pqTLo/hoV2iBT3To4Zy6ZdH4bdrLMoWi5iBlHCR2ICNahCsIc2gtS5kWnL8MOyhzPyVt+W7oxx0=
X-Gm-Message-State: AOJu0Yxs70kdfrkM4BjwJhZ9XK2amagK92WSvvr/49887V237g6AeEgW
	ZCe7ypt01LaWpCbs7KkwpvPYq8TRzxZvTFAh4VthZk3XnaZJqpf/VJbofBOtM0Y=
X-Google-Smtp-Source: AGHT+IEuzGvqOx+CJn8+ngQ6wq+yNcOQ5SwMgj65i/w5xebwMp/JUWhvk16to16y5nw6Ab/qtlNpZw==
X-Received: by 2002:a17:906:a846:b0:a3c:6ef:70d5 with SMTP id dx6-20020a170906a84600b00a3c06ef70d5mr815662ejb.7.1707496497544;
        Fri, 09 Feb 2024 08:34:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWNR1Wu0AH7TwRM1cyf+4y6hmwU09apaGNrtSLxqPAf+cLkcsVRhyWgIvi4vpxxzu0QNlNPayZ3VTfMG6RCijGEgQCB0rkEJgIpnfkDiGFqbdjd0nZUm6vTVgy8I5CnzW7STTAANw1qbybuLddOv2wgh+6/VwxRZ+zfU5kO/MmoNrk+NLyu+BhD33XPcH0cQM4rke24hmm4e+yAryncn6neGe/PYayf/AmCLbPv28rqdL5w3Lcf8hfNEJBDaA5p604pPETmyMsbv0kBPgOdFKOPdaif1nLenjXfrMRdmCLxlWJ1j7yJcg==
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id wt11-20020a170906ee8b00b00a389d911606sm911203ejb.88.2024.02.09.08.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 08:34:56 -0800 (PST)
From: srinivas.kandagatla@linaro.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	regressions@lists.linux.dev,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	asahi@lists.linux.dev,
	Sven Peter <sven@svenpeter.dev>
Subject: [PATCH] nvmem: include bit index in cell sysfs file name
Date: Fri,  9 Feb 2024 16:34:54 +0000
Message-Id: <20240209163454.98051-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4621; i=srinivas.kandagatla@linaro.org; h=from:subject; bh=f5Yj5EdsIahQdYEwLhKw5sXoADI6Fd5YUQv5rR1Hhoc=; b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBlxlQuDY7GMTl1T49CKqNQ63pn3xdIimhBS5Od0 aKoOl/PBMWJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZcZULgAKCRB6of1ZxzRV N97HCACSwnmn4enb2qu29UKONCkfhIhpIoD9WfAgFcjle9dvo+P0ecCCcnljzrVOcA/CXT8OoXz +lXNUhjaTsvy3io6HKTj7GvnBrb6aYhnRHcYGOXp7o/SQaagtSQt02RBwCHiR82N+lZ7F58t1LB pS9iwEGhmRs+tAbpTMKuufERPmX+XaFJgU6tfLfRCPrQhV8Z/RbRy6dIcJkOev5oq1ZK7XUSy8V LBsib3t6ayY2R8y68JLfI62/VsFrr+jMQNj5KyX8EHudTjxNzXAbU6+iqEE6bTWT0HeHyVikcOX FbjG/ghUU0zcdYEE1LHKyAvYAqqIkE4yRz3HOaE6J+ysfaQH
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp; fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Creating sysfs files for all Cells caused a boot failure for linux-6.8-rc1 on
Apple M1, which (in downstream dts files) has multiple nvmem cells that use the
same byte address. This causes the device probe to fail with

[    0.605336] sysfs: cannot create duplicate filename '/devices/platform/soc@200000000/2922bc000.efuse/apple_efuses_nvmem0/cells/efuse@a10'
[    0.605347] CPU: 7 PID: 1 Comm: swapper/0 Tainted: G S                 6.8.0-rc1-arnd-5+ #133
[    0.605355] Hardware name: Apple Mac Studio (M1 Ultra, 2022) (DT)
[    0.605362] Call trace:
[    0.605365]  show_stack+0x18/0x2c
[    0.605374]  dump_stack_lvl+0x60/0x80
[    0.605383]  dump_stack+0x18/0x24
[    0.605388]  sysfs_warn_dup+0x64/0x80
[    0.605395]  sysfs_add_bin_file_mode_ns+0xb0/0xd4
[    0.605402]  internal_create_group+0x268/0x404
[    0.605409]  sysfs_create_groups+0x38/0x94
[    0.605415]  devm_device_add_groups+0x50/0x94
[    0.605572]  nvmem_populate_sysfs_cells+0x180/0x1b0
[    0.605682]  nvmem_register+0x38c/0x470
[    0.605789]  devm_nvmem_register+0x1c/0x6c
[    0.605895]  apple_efuses_probe+0xe4/0x120
[    0.606000]  platform_probe+0xa8/0xd0

As far as I can tell, this is a problem for any device with multiple cells on
different bits of the same address. Avoid the issue by changing the file name
to include the first bit number.

Fixes: 0331c611949f ("nvmem: core: Expose cells through sysfs")
Link: https://github.com/AsahiLinux/linux/blob/bd0a1a7d4/arch/arm64/boot/dts/apple/t600x-dieX.dtsi#L156
Cc: regressions@lists.linux.dev
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Rafał Miłecki <rafal@milecki.pl>
Cc: Chen-Yu Tsai <wenst@chromium.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: asahi@lists.linux.dev
Cc: Sven Peter <sven@svenpeter.dev>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
Hi Greg, 

Here is a fix in nvmem for 6.8, could you queue these for next possible rc.

Did not cc Stable as this is only targeted for 6.8 and no backporting is
required.

Thanks,
Srini

 Documentation/ABI/testing/sysfs-nvmem-cells | 16 ++++++++--------
 drivers/nvmem/core.c                        |  5 +++--
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-nvmem-cells b/Documentation/ABI/testing/sysfs-nvmem-cells
index 7af70adf3690..c7c9444f92a8 100644
--- a/Documentation/ABI/testing/sysfs-nvmem-cells
+++ b/Documentation/ABI/testing/sysfs-nvmem-cells
@@ -4,18 +4,18 @@ KernelVersion:	6.5
 Contact:	Miquel Raynal <miquel.raynal@bootlin.com>
 Description:
 		The "cells" folder contains one file per cell exposed by the
-		NVMEM device. The name of the file is: <name>@<where>, with
-		<name> being the cell name and <where> its location in the NVMEM
-		device, in hexadecimal (without the '0x' prefix, to mimic device
-		tree node names). The length of the file is the size of the cell
-		(when known). The content of the file is the binary content of
-		the cell (may sometimes be ASCII, likely without trailing
-		character).
+		NVMEM device. The name of the file is: "<name>@<byte>,<bit>",
+		with <name> being the cell name and <where> its location in
+		the NVMEM device, in hexadecimal bytes and bits (without the
+		'0x' prefix, to mimic device tree node names). The length of
+		the file is the size of the cell (when known). The content of
+		the file is the binary content of the cell (may sometimes be
+		ASCII, likely without trailing character).
 		Note: This file is only present if CONFIG_NVMEM_SYSFS
 		is enabled.
 
 		Example::
 
-		  hexdump -C /sys/bus/nvmem/devices/1-00563/cells/product-name@d
+		  hexdump -C /sys/bus/nvmem/devices/1-00563/cells/product-name@d,0
 		  00000000  54 4e 34 38 4d 2d 50 2d  44 4e         |TN48M-P-DN|
 		  0000000a
diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 980123fb4dde..eb357ac2e54a 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -460,8 +460,9 @@ static int nvmem_populate_sysfs_cells(struct nvmem_device *nvmem)
 	list_for_each_entry(entry, &nvmem->cells, node) {
 		sysfs_bin_attr_init(&attrs[i]);
 		attrs[i].attr.name = devm_kasprintf(&nvmem->dev, GFP_KERNEL,
-						    "%s@%x", entry->name,
-						    entry->offset);
+						    "%s@%x,%x", entry->name,
+						    entry->offset,
+						    entry->bit_offset);
 		attrs[i].attr.mode = 0444;
 		attrs[i].size = entry->bytes;
 		attrs[i].read = &nvmem_cell_attr_read;
-- 
2.25.1

