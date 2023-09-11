Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2192764A
	for <regressions@lists.linux.dev>; Mon, 11 Sep 2023 00:42:55 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-68fbb10dec7so391020b3a.3
        for <regressions@lists.linux.dev>; Sun, 10 Sep 2023 17:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694392975; x=1694997775; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y51wbrzEwejYx5+FDlSD7203yaJ7hGL9WN8KLP+gjDI=;
        b=FF/o0vNLuCnf8FNPvVqGUAbgmwsTXOJehKN7233C5kG/wCrbjoaCYoh8g7TedeJ/OV
         tE16/mMl3StMtbgIGV/ZMq0TRMvgIRzl5NtwwqVGRIt/S+vn3gZa22Tve8VQuDsIFdw0
         I9KG+zVUAaoV6/iXZ7fmUYTZZzaiQ8tPFy1MjRwdUN/wL9rtBBnkVCz7AKFmZOd+IaxL
         f4jaMh6O8bnstIDETPa4PQG1UBp+QhYb7Yg60xFT6WoHNPvdrEHlBIMkGeRRMggfRYPv
         9eL735ExB0fUt90tIJ9agRyjfIxgMdVN8rrqVjYairYR3BzH8qGcYfssEqrPCbU0tnw2
         PxOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694392975; x=1694997775;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y51wbrzEwejYx5+FDlSD7203yaJ7hGL9WN8KLP+gjDI=;
        b=i6W/vhVg4GTc6bDa9tdCa78JV1gSEal/7wrZAmCb/k9hRh/gL+yXMDCz4d1oxbtM0v
         p4qLwOIJ94aLiZtthLIoHUul2j9eJ8I/Tv1dP/tn3qcn9zuxjAtNQGuPto3SAzEpHlAr
         DiRWJahwBTQ3Nfa0MWF4duE86ikuK71RnX/X3AuygPszgRKyl+HW4uEXFAydXoI+8BW/
         c+9YdRuIe7W+SxVTvBOdIuZhLXPfS3rbehjZoi4l/X4geotO2r5RY5Wl8Uc/lg4g6Kaf
         f5XMxFXWt0h1M8Zoxi1q3w3xGIVmoD1gH/l0F6gRTyBjbxq+o2TXVI5z1ytT0Ezvmm5+
         1cvw==
X-Gm-Message-State: AOJu0YxDA9kv8HsI/Oy629lruZ3CXpc37iL2hQ2iRfAUyjwHEhSrlTnL
	KcdJevJ1/4WRB1V4T/CJkl4=
X-Google-Smtp-Source: AGHT+IHI2ZZ7QHtExuD/eqB1Ya6GPgmn7FLcxaygVbL1JZcEnVaUGonn6AGT6uiu9PeW05vkmgA2PA==
X-Received: by 2002:a05:6a00:150e:b0:68a:4dc3:dbb9 with SMTP id q14-20020a056a00150e00b0068a4dc3dbb9mr7961082pfu.28.1694392975150;
        Sun, 10 Sep 2023 17:42:55 -0700 (PDT)
Received: from [192.168.0.106] ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id e22-20020aa78256000000b0068c61848785sm4344634pfn.208.2023.09.10.17.42.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Sep 2023 17:42:54 -0700 (PDT)
Message-ID: <c64ce498-7c06-3726-47d5-0a74471f027b@gmail.com>
Date: Mon, 11 Sep 2023 07:42:48 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Gregory Greenman <gregory.greenman@intel.com>,
 Johannes Berg <johannes.berg@intel.com>, Ronan Pigott <ronan@rjp.ie>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Wireless <linux-wireless@vger.kernel.org>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: iwlwifi: AX210 Timeout waiting for hardware access (CSR_GP_CNTRL
 0xffffffff)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> In linux 6.5.2, loading firmware version 83 on AX210 device appears to fail (repeatedly) with a timeout. Reverting to linux 6.4.12 successfully loads firmware 78.
> 
> My nic:
> $ lspci -kd::280
> 08:00.0 Network controller: Intel Corporation Wi-Fi 6 AX210/AX211/AX411 160MHz (rev 1a)
> 	Subsystem: Rivet Networks Wi-Fi 6 AX210/AX211/AX411 160MHz
> 	Kernel driver in use: iwlwifi
> 	Kernel modules: iwlwifi
> 
> The failing kernel:
> $ pacman -Qp /var/cache/pacman/pkg/linux-6.5.2.arch1-1-x86_64.pkg.tar.zst 
> linux 6.5.2.arch1-1
> 
> The error:
> $ journalctl -b -1 _KERNEL_DEVICE=+pci:${$(lspci -Dd::280)[(w)1]} + _TRANSPORT=kernel > dmesg65.log
> 
> [..attached..]
> 
> The interesting bit:
> Sep 09 20:30:28 kernel: iwlwifi 0000:08:00.0: WRT: Invalid buffer destination
> Sep 09 20:30:29 kernel: ------------[ cut here ]------------
> Sep 09 20:30:29 kernel: Timeout waiting for hardware access (CSR_GP_CNTRL 0xffffffff)
> Sep 09 20:30:29 kernel: WARNING: CPU: 13 PID: 679 at drivers/net/wireless/intel/iwlwifi/pcie/trans.c:2190 __iwl_trans_pcie_gr>
> Sep 09 20:30:29 kernel: Modules linked in: iwlmvm(+) snd_sof_pci_intel_tgl snd_sof_intel_hda_common soundwire_intel snd_sof_i>
> Sep 09 20:30:29 kernel:  snd_hwdep intel_rapl_msr dell_smm_hwmon processor_thermal_rfim i2c_i801 realtek btmtk alienware_wmi >
> Sep 09 20:30:29 kernel: CPU: 13 PID: 679 Comm: modprobe Not tainted 6.5.2-arch1-1 #1 d2912f929551bc8e9b95af790b8285a77c25fa29
> Sep 09 20:30:29 kernel: Hardware name: Dell Inc. XPS 8950/0R6PCT, BIOS 1.2.1 03/25/2022
> [...]
> Sep 09 20:30:29 kernel: Call Trace:
> Sep 09 20:30:29 kernel:  <TASK>
> Sep 09 20:30:29 kernel:  ? __iwl_trans_pcie_grab_nic_access+0x14a/0x150 [iwlwifi 25a8da985d322177fdc2dbc451d4271c449a7a6f]
> Sep 09 20:30:29 kernel:  ? __warn+0x81/0x130
> Sep 09 20:30:29 kernel:  ? __iwl_trans_pcie_grab_nic_access+0x14a/0x150 [iwlwifi 25a8da985d322177fdc2dbc451d4271c449a7a6f]
> Sep 09 20:30:29 kernel:  ? report_bug+0x171/0x1a0
> Sep 09 20:30:29 kernel:  ? prb_read_valid+0x1b/0x30
> Sep 09 20:30:29 kernel:  ? handle_bug+0x3c/0x80
> Sep 09 20:30:29 kernel:  ? exc_invalid_op+0x17/0x70
> Sep 09 20:30:29 kernel:  ? asm_exc_invalid_op+0x1a/0x20
> Sep 09 20:30:29 kernel:  ? __iwl_trans_pcie_grab_nic_access+0x14a/0x150 [iwlwifi 25a8da985d322177fdc2dbc451d4271c449a7a6f]
> Sep 09 20:30:29 kernel:  iwl_trans_pcie_grab_nic_access+0x1a/0x40 [iwlwifi 25a8da985d322177fdc2dbc451d4271c449a7a6f]
> Sep 09 20:30:29 kernel:  iwl_read_prph+0x1d/0x60 [iwlwifi 25a8da985d322177fdc2dbc451d4271c449a7a6f]
> Sep 09 20:30:29 kernel:  iwl_mvm_load_ucode_wait_alive+0x2d9/0x620 [iwlmvm 7d9113127caff2df016f1a19aad637aa20200412]
> [...]
> Sep 09 20:30:29 kernel: ---[ end trace 0000000000000000 ]---
> Sep 09 20:30:29 kernel: iwlwifi 0000:08:00.0: iwlwifi transaction failed, dumping registers
> [...]
> 
> See attachment for full log.
> 
> Boot after revert to 6.4.12 with working firmware:
> $ journalctl --no-hostname -b _KERNEL_DEVICE=+pci:${$(lspci -Dd::280)[(w)1]} + _TRANSPORT=kernel > dmesg64.log
> 
> [..attached..]
> 
> The interesting bit:
> Sep 09 20:48:23 kernel: iwlwifi 0000:08:00.0: loaded firmware version 78.3bfdc55f.0 ty-a0-gf-a0-78.ucode op_mode iwlmvm
> 
> 
> $ pacman -Ql linux-firmware | grep ty.a0.gf.a0                            
> linux-firmware /usr/lib/firmware/iwlwifi-ty-a0-gf-a0-59.ucode.zst
> linux-firmware /usr/lib/firmware/iwlwifi-ty-a0-gf-a0-66.ucode.zst
> linux-firmware /usr/lib/firmware/iwlwifi-ty-a0-gf-a0-72.ucode.zst
> linux-firmware /usr/lib/firmware/iwlwifi-ty-a0-gf-a0-73.ucode.zst
> linux-firmware /usr/lib/firmware/iwlwifi-ty-a0-gf-a0-74.ucode.zst
> linux-firmware /usr/lib/firmware/iwlwifi-ty-a0-gf-a0-77.ucode.zst
> linux-firmware /usr/lib/firmware/iwlwifi-ty-a0-gf-a0-78.ucode.zst
> linux-firmware /usr/lib/firmware/iwlwifi-ty-a0-gf-a0-79.ucode.zst
> linux-firmware /usr/lib/firmware/iwlwifi-ty-a0-gf-a0-81.ucode.zst
> linux-firmware /usr/lib/firmware/iwlwifi-ty-a0-gf-a0-83.ucode.zst
> linux-firmware /usr/lib/firmware/iwlwifi-ty-a0-gf-a0.pnvm.zst
> 

See Bugzilla for the full thread and attached journal logs.

On BZ, I have asked the reporter (Cc'ed) to test the mainline.

Anyway, I'm adding this regression to regzbot:

#regzbot introduced: 399762de769c4e https://bugzilla.kernel.org/show_bug.cgi?id=217894
#regzbot title: CSR_GP_CNTRL hardware access timeout due to firmware API bump

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217894

-- 
An old man doll... just what I always wanted! - Clara
