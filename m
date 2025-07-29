Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F072E36E4
	for <regressions@lists.linux.dev>; Tue, 29 Jul 2025 10:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753783423; cv=none; b=MSVmayHD6+UtgvPGB7TYyiogjG1YkWHCdlpkNMDRoIPWAxTmZPxEzY/yXIAds+EM+q8mcb+yij97PdBcbBHNqgUfxYZhaJ4rwlQChaIFa4ZuYwGIxu9DCPAIwOnfApeUwYmRa+wLeiWWBcFy3VoixnvN7uTGm+xNsIwKOw5Nbeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753783423; c=relaxed/simple;
	bh=D+MVLwJmF7zcQQs5GBiAvtVf89SV7MV1UDodoYOOKcM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=YOc1fploxe7q4X0+2/adsnnSv4A0H1Slj7JB1nZ/iOttqPxn+h52CbbxV2PIPX+VhGv/Y7QqdVHn7D5hL2+qSHYTpUAOEqVCOpdurbnlJbC/9dRszLHOUIHgbxrBTUO2OtnaeW0SuNqc3ANDFy4xGJBPmkIHazHUFTwXooncaPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P3GZ2CTG; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P3GZ2CTG"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ae0e0271d82so1018226566b.3
        for <regressions@lists.linux.dev>; Tue, 29 Jul 2025 03:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753783420; x=1754388220; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=D+MVLwJmF7zcQQs5GBiAvtVf89SV7MV1UDodoYOOKcM=;
        b=P3GZ2CTGE10Daun07r7JiIrPKf6FjEKt0GcqM23IdpaDaU1hxYHAI8aYN4QV4/q/xr
         IOrxPod3MBYjXktpzwbQRXBGFk79xwZAWyY5UdmECKWPcHc3zaEiavgAQ9D00RA2dxkS
         c0p08HH7KemiwcucFTSlB3WwBRzZKx6X+ADB/Vj5sBkOBlbkyVpcZWtL4W0AcJ5cupK7
         V8FD59wp4NAmZhlpMvClWnQo8ylaGwnUozEGUONkhwfeflNKtjjrHQxUx4+M9ylcPOJy
         Xdqzv/V9juW36/kROgjRPi13nPi/nVM+CiqR4F24bPttkA8847FNJdtvHehUP9HV8f4r
         5JNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753783420; x=1754388220;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D+MVLwJmF7zcQQs5GBiAvtVf89SV7MV1UDodoYOOKcM=;
        b=Yv9c7zbck4vkNxmJVFOvStuBAWvJGjr93sNk2X/K52c5ezLRm3Yd18TNoZl9MXTXlw
         M+WzV9kGV67EqvsdpOtvHngVNvf/mKGR98EjRTPfrVszhXT574O+CNfDUV5HbO5nRdIF
         qcjGV10wme3o7ht1PKElN7VO6tiKVNhKwNKfbpYXOuPdZHth43Rb3bLZ3ytxnBXTxiOL
         jQAJuVoAYt/kF4QgAvxTjaJSSSkNHfM0rq//x/eOmpOw+dojRYKi6Anyl8cvkp+XWYmF
         NP2sPzt3n3O42Gn9ibgSb0ph3qInKWVni2afCtAFk4xVK4e8MfmZD0T0/XXGDadFyEe2
         Xilw==
X-Forwarded-Encrypted: i=1; AJvYcCXEqL4cTLAxwx7WqxQImyFkcyBG5KB6n165suaZCXXnVG4Jn2FGsEX2dbnnpYn4DTp0vgqgw4n7OJSRhQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwF5XIzJqKtn52YHT6Jj4MWxeh8xEwviNb4OkJvnQS8/npH+Wz5
	wtcqQxmr3TO4+3qstbx/AEtPBvfI3kRkJoVaJd0+dVMaLYd15Z0NaC9e+kcctTMTtsPgxasFPDA
	1HGcerznICwDbxIxaNXBiyVy7LplBTu5QtKQszbQ=
X-Gm-Gg: ASbGnctQeS1+g0PeGNbH1XY6QNPn7MB8QuGFton0In9D6QbL0C6zfTl6kwAuvDi59uJ
	PnKq5iyd8t3GwHzoWsbzjUgFRHTClditkba9EqJxuAMCwVxcvNejBC+9SPgnmJK74pYYvOAwLxz
	Eii25CUcTdqFctzFjg6BV+s39xFjWI+KrN3/UxVqdKnHvkTe/lBPo0raGBLWCBOGgViGtJ0QgBw
	zlZiWcT
X-Google-Smtp-Source: AGHT+IFR5NqoKoHtBXiwuzultk2/wcc4NDM8ArexVgiStAANSbiLZ+rEDOZQAChRg5bGXQycZF4dSKht6k9SVrysExk=
X-Received: by 2002:a17:907:6d18:b0:add:f2c8:7d3f with SMTP id
 a640c23a62f3a-af618f02439mr1594000566b.33.1753783419635; Tue, 29 Jul 2025
 03:03:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Andy Mindful <andy.mindful@gmail.com>
Date: Tue, 29 Jul 2025 13:03:27 +0300
X-Gm-Features: Ac12FXwT2AD8p3BCcLoITIH5kuPJ0_AKKpOAxOhi7hBOjcX8afUCURN2eTIOkdw
Message-ID: <CACTEcX6oXBot1VBApOyKVMVXsAN9BsvQMLa8J0iKpNeB-eLttQ@mail.gmail.com>
Subject: [REGRESSION] tty lockup and WWAN loss after hibernate/suspend in 6.8+
 on ThinkPad X1 Carbon Gen 10
To: linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	linux-pm@vger.kernel.org
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-acpi@vger.kernel.org, rafael@kernel.org, jani.nikula@intel.com, 
	ville.syrjala@linux.intel.com, tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"

Kernel-version: 6.8+ (confirmed in Fedora kernel 6.8.4-200.fc38.x86_64
and above)
Regression-from: 6.7.11 (working) to 6.8.4+ (regressed)
Affected-hardware: Lenovo ThinkPad X1 Carbon Gen 10 (Intel Alder Lake platform)
Affected-subsystems: TTY/Console, Power Management, WWAN Modem (Intel
XMM7560, iosm driver), Kernel DRM/i915 stack

Description:
We are reporting a significant regression introduced in Linux kernel
version 6.8 (specifically confirmed in Fedora kernel
6.8.4-200.fc38.x86_64 and subsequent versions), affecting Lenovo
ThinkPad X1 Carbon Gen 10 laptops. This regression manifests primarily
as tty lockups and complete loss of WWAN modem functionality after
hibernate cycle.

Problematic Behavior:
1. TTY/Console: After a hibernate cycle, the console input becomes
unresponsive. In some cases, after suspend, pressing `SysRq+R` (unraw)
can temporarily restore keyboard functionality, but this is not
consistent, especially after hibernation.
2. Power Management: While S3 suspend works correctly when "Linux
only" is set in BIOS, `suspend` causes the system to freeze upon
resume if "Windows + Linux" mode (which implies `s2idle`) is active in
BIOS settings.
3. WWAN Modem (Intel XMM7560, `iosm` driver): The modem fails to
reinitialize after hibernation, consistently showing "msg timeout"
errors in logs. The modem works correctly after a cold boot but
completely fails to recover after resuming from hibernate. Rescanning
PCI devices or reloading the `iosm` module does not resolve the issue.
Attempts to manually remove the device via
`/sys/bus/pci/devices/.../remove` result in a system hang.
4. Kernel DRM/i915 stack: Although GuC and HuC firmware (versions
70.44.1 / 7.9.3) are confirmed to load correctly, logs indicate
potential graphics driver reinitialization issues in affected kernel
versions. This might contribute to the TTY unresponsiveness.

System Specifications:
- Laptop: Lenovo ThinkPad X1 Carbon Gen 10
- CPU: Intel Core i7-1260P (Alder Lake)
- GPU: Intel iGPU (ADL GT2) - i915
- WWAN: Intel XMM7560 (iosm driver)
- Wi-Fi/Bluetooth: Intel AX201
- Operating Systems tested:
- Fedora 38 (most stable with 6.7.11)
- Fedora 39/40/42 (exhibit regression)
- Ubuntu 22.04, 24.10 (exhibit regression)
- EndeavourOS_Mercury-Neo-2025.03.19 (exhibits regression)
- Display manager: GDM/Wayland (also tested LightDM + Xfce and
runlevel 3, problem persists).
- Mesa Stack: Mesa 24.3.4 built with LLVM 16.0.6 (confirmed functional
with working kernels). Vulkan, GBM, EGL, GLX render correctly with
`iris` and `intel` drivers. Custom Mesa 24.3.4 build showed no impact
on the hibernate issue.

Behavior Matrix:
| Kernel Version | Hibernate Status | Resume Status | TTY
Functionality | WWAN Functionality | Notes |
|----------------|------------------|---------------|-------------------|--------------------|-------|
| 6.2.9 | OK | Not tested | OK | Not Tested | Working baseline |
| 6.3.12 | OK | Not tested | OK | Not Tested | Working baseline |
| 6.7.11 | OK | OK(S3)/Fail(S2idle) | OK | FAIL | WWAN regression
starts here, but hibernate/tty still OK |
| **6.8.4+** | FAIL | OK(S3)/Fail(S2idle) | FAIL | FAIL | Major
regression point, affects hibernate/tty/WWAN |
| 6.14+ | FAIL | OK(S3)/Fail(S2idle) | FAIL | FAIL | Problem persists
in newer kernels |

Additional Details:
- Hibernation issues:
- Initial `mem_sleep` was `[s2idle]` in BIOS "Windows + Linux" mode.
- Switching BIOS to "Linux only" enabled proper S3 suspend, changing
`/sys/power/mem_sleep` to `[s2idle] deep`. However, the hibernation
issue (TTY lockup, WWAN loss) persists even with S3 enabled for
suspend.
- `Alt + SysRq + R` sometimes revives console after suspend but
*never* after hibernate.
- TTY related errors observed in logs are, dmesg:
`tty_flip_buffer_push: called while buffer locked`, systemd-logind:
`New session created but VT is not initial VT, ignoring`, GDM:
`GdmLocalDisplayFactory: active VT is not initial VT` on kernels 6.8+.
- WWAN issues:
- The `iosm` driver appears loaded, and the device is visible via
`lspci`, but the modem is not visible to `mmcli` after resume from
hibernate.
- The WWAN modem (iosm) only works after a cold boot.
- Rescanning PCI or reloading `iosm` module (e.g., `modprobe -r iosm
&& modprobe iosm`) does not resolve the issue.
- Manual removal via `/sys/bus/pci/devices/.../remove` leads to a
system hang, indicating a deeper issue with device state or driver
interaction post-resume.

Tested Alternatives & Current Stability:
- Hibernate works reliably only up to kernel 6.7.11.
- Fedora 38 with kernel 6.7.11 + GNOME 44.10 is currently the most
stable configuration for this hardware, despite the WWAN issue already
present there (but not the tty lockup/hibernate issue).
- Kali Linux with 6.6.9 - hibernation works.
- Newer distributions (e.g., Fedora 42, Ubuntu 25.04, EndeavourOS)
inherit the same problems due to their newer kernel versions.

Expected Behavior:
The system should resume from hibernate and suspend without TTY
lockups, and the WWAN modem should reinitialize correctly and be fully
functional.

Steps to Reproduce:
1. Ensure system is running a kernel version 6.8.4 or newer (e.g.,
Fedora 38 with `6.8.4-200.fc38.x86_64`).
2. Perform a `systemctl hibernate` or `systemctl suspend`.
3. Resume the system.
4. Observe TTY console unresponsiveness(only in runlevel 3) and check
WWAN modem status using `mmcli -L`.

Please let me know if any further information or testing is required.

Thank you.

Best regards,
Andriy
