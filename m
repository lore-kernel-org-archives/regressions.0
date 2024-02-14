Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C68604BB;
	Wed, 14 Feb 2024 15:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707924563; cv=none; b=HF6nfDtkbSrszu5/jJWo62OrXoFuaYXtp3lC3rXls4E7yxZXb3ECcVySxCsrk+R1iPZM6tDlMJr9vbioXMR8Ly+V8PuG8YJE2+6coEulzugKV92KC+ZuLtKptHHHTo1sFtTaG5eV/NwTFNUN/ld7f1xzEhP/YTeT+xo2rn5Oc3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707924563; c=relaxed/simple;
	bh=WSVW0/yRq/loi7RjpiNIEx5uLj/WloPZ3vFmrSyly+0=;
	h=Subject:To:From:Date:Message-ID:MIME-Version:Content-Type; b=PbErwq1bHTu/jsA78NyaGXUMbs7l6zmdmCLvQJkDSKkw2K1Y+OOlsmYqgcczorm2fXf2wEjS5UOUK1WDgb0Yjr7TNYRAi62E6oSFJlTtOmO4cCrTpoeO3zhglUDFr+R42HOgsYHYgNQcZ1l3jWu7BHO3Yjd8pOzTQlvfgpXzxxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tNvRMyjG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tNvRMyjG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D41EC433F1;
	Wed, 14 Feb 2024 15:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707924561;
	bh=WSVW0/yRq/loi7RjpiNIEx5uLj/WloPZ3vFmrSyly+0=;
	h=Subject:To:From:Date:From;
	b=tNvRMyjGCEvwlkTYypLNN+WA7/RbF4OkERMRblDFP4vuH9HqMokpWrtj5ZFT7hxjP
	 iPFQqU2kp64zEtkH/tQU38ts4KxGpLVnXZrHiTAwTQLfb9U6VnBX7JnrP5frC/Owg4
	 8gBDuiEorrq1ySrDa0o4X1XhpOQosGhCbNACk/gU=
Subject: patch "nvmem: include bit index in cell sysfs file name" added to char-misc-linus
To: arnd@arndb.de,asahi@lists.linux.dev,ecurtin@redhat.com,gregkh@linuxfoundation.org,miquel.raynal@bootlin.com,rafal@milecki.pl,regressions@lists.linux.dev,srinivas.kandagatla@linaro.org,sven@svenpeter.dev,wenst@chromium.org
From: <gregkh@linuxfoundation.org>
Date: Wed, 14 Feb 2024 16:29:18 +0100
Message-ID: <2024021418-humvee-scotch-5836@gregkh>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


This is a note to let you know that I've just added the patch titled

    nvmem: include bit index in cell sysfs file name

to my char-misc git tree which can be found at
    git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git
in the char-misc-linus branch.

The patch will show up in the next release of the linux-next tree
(usually sometime within the next 24 hours during the week.)

The patch will hopefully also be merged in Linus's tree for the
next -rc kernel release.

If you have any questions about this process, please let me know.


From e20f378d993b1034eebe3ae78e67f3ed10e75356 Mon Sep 17 00:00:00 2001
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 9 Feb 2024 16:34:54 +0000
Subject: nvmem: include bit index in cell sysfs file name
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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
Cc:  <regressions@lists.linux.dev>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Rafał Miłecki <rafal@milecki.pl>
Cc: Chen-Yu Tsai <wenst@chromium.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:  <asahi@lists.linux.dev>
Cc: Sven Peter <sven@svenpeter.dev>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Eric Curtin <ecurtin@redhat.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Link: https://lore.kernel.org/r/20240209163454.98051-1-srinivas.kandagatla@linaro.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
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
2.43.1


