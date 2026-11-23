Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795464706;
	b=EbNGOEBKWapUVOvHZ4W8tX94msaJU3MwnkQ+bA7i4XJg5DDWvMjQXMxCaTE3MB51eG54
	 +Ty+oAsrf/ZAPN8UULTJF5D8ts9W27alKeP6c1sDGHPMC9wWiGZpVHIWgb9osbzyd89Fn
	 7/7t1vBEa2JkxLUjqIdp4Gowd+zxKOegnKwcFoT19ySNwvIROfD4CaEfEGn3SyjQlUDDl
	 RuxedZssUEtKKjcF2hq+AmldanLAsmPuSc8t/04fkmqcM/TGMlZdoN3foldTF8LhcSFR/
	 +kdFQCoRJLkk0YX7rsMyD0OogtonB5AVfOxYB0LOILwEdEui7UjAclAdU5wjnRubW6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795464706;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 In-Reply-To:Organization:References:Date:Message-ID:MIME-Version:
	 Content-Type;
	bh=mvNLv+3AciGOuDYZYe5oeiw60CL3pQrdkfZwl/FSt6I=;
	b=tAMuCWfFrQxf8TfSDs79XF0C2anHcQsDTglgFi+31v8NprS+YQeZGJnA5H2ckpdqBTOk
	 0UoTO/5ZMlqXUMQACGQmWkeh/lyWlUfwPXdxuiG7pbv4oQKhhEXa5ow63DE97KSzpb4xG
	 W4HC63naLU/yEnvS2RFPqRNO0DUTGP8CtTcSAJpvtlosXtrDkXuK86xZS5rUAgYO3HzJC
	 Ve3zF5gyU8SGAqYv0w85QrG+AMB7PPGU5CvryM/GgnAKKw4tN2kFd26+p2nxytuRRZKAW
	 bVvnRvPhO2tkpneQGDW9X1I7Bv48oTYyYjv2CxBhkM48oNbl6vVrVToVctAmRKjjvrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I1Gq0Ws2;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D23C606A31E
	for <regressions@lists.linux.dev>; Mon, 23 Nov 2026 20:11:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D23C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I1Gq0Ws2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795464705; x=1827000705;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=2kLKLPpRTmFaPuxKkqTgwxOS8eKQF0S0JzNbhLZpn2o=;
  b=I1Gq0Ws2AXgp5m94RlNyUC2wCyEc+9UiSf/V+ncmvq1bfKZ5V1i3OXub
   UhaxhQJJcPtGxrSuSqIheXnilk19wXxcWwMx8TCcUcnJUoMTHospTZlHa
   uT1k1LTw7OKgJpbHPJmb9dnAWcVAAgyJ0NKfw4wKmcotIuJvU1w0ab6vt
   6qlQzI+lci5wrL+CZ/rZMSocz6mzMMqLkdDAInmevz9r7fkzv2jKwXwVR
   w3eE2xFzllOgy0ajSN+vi3CF9/aVeQ12cb+Js1khCWXYeMu6sQTj1WF6Q
   IjlfaTrJd+9MbBTE0htyV9LtTPBZvCIkn5EZlNDXFLLUebISZuB5B9hHt
   A==;
X-CSE-ConnectionGUID: 6r+ucEzjQh2L5JaESkb3pw==
X-CSE-MsgGUID: OcRqhTdxR82CGhfxdXtBSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4314488"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4314488"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 12:11:45 -0800
X-CSE-ConnectionGUID: vgUm4O1aS1iDJySwOPFZqQ==
X-CSE-MsgGUID: Xhe+vywERkenqos8aRRfig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11497837"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 12:11:43 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ronald Rechenmacher <ron@fnal.gov>, "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] thunderbolt: Barlow Ridge DP tunnel reports UHBR20
 in BW allocation mode for HBR3-only DP OUT, external monitors stay black
 (v7.2 -> v7.3)
In-Reply-To: <DS5PR09MB1353250098A5804464BB8BAE6DC782@DS5PR09MB13532.namprd09.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <DS5PR09MB1353250098A5804464BB8BAE6DC782@DS5PR09MB13532.namprd09.prod.outlook.com>
Date: Mon, 23 Nov 2026 22:11:41 +0200
Message-ID: <7c77eaf0bdd8370e2259c654dd866561ca07d382@intel.com>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Fri, 20 Nov 2026, Ronald Rechenmacher <ron@fnal.gov> wrote:
> Subject: [REGRESSION] thunderbolt: Barlow Ridge DP tunnel reports UHBR20 in BW allocation mode for HBR3-only DP OUT, external monitors stay black (v7.2 -> v7.3)
>
> To: Thunderbolt/USB4 maintainers, linux-usb
> Cc: i915/DP tunnel developers, intel-gfx, regressions
>
> Hi,
>
> Since moving from 7.2 to 7.3, the external monitors behind a Thunderbolt 5
> dock stay black. They are detected, read EDID, and show up in the desktop's
> display settings, but no picture appears. Booting with
> thunderbolt.bw_alloc_mode=0 fixes it completely.

Does [1] fix it?

If not, please file a bug as described at [2]


BR,
Jani.


[1] https://lore.kernel.org/r/20261123120954.1115838-1-imre.deak@intel.com
[2] https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html


>
> #regzbot introduced: v7.2..v7.3
>
> Hardware
> --------
> - Laptop: Dell Pro Max 18 Plus MB18250, BIOS 3.5.2 (10/15/2026)
> - CPU/display: Arrow Lake-HX, i915 (MTL display version 14.00, PCI 8086:7d67)
> - Host router: Barlow Ridge JHL9580 (8086:5780/5781), NVM 64.81; the
>   i915 DDI TC3 port is wired to the router's DP IN (TC port mode "legacy")
> - Dock: Dell Pro TBT5 Dock WD25TB5 (Barlow Ridge hub JHL9480), NVM 69.81,
>   internal Synaptics MST branch (DPCD 1.4, max HBR3 x4)
> - 3 monitors on the MST hub: 2x 3840x2160@60 (one uses DSC), 1x 1920x1080@60
> - USB4 link to the dock comes up asymmetric (3 RX / 1 TX, 40 Gb/s lanes)
>
> Kernels
> -------
> - Good: 7.2.15 (Fedora 7.2.15-200.fc44)
> - Bad:  7.3.3  (Fedora 7.3.3-300.fc45)
> - The 7.3.4 stable changelog has no i915, drm display, or thunderbolt
>   changes, so I expect 7.3.4 to be affected too (not tested).
>
> What happens
> ------------
> Both tunnel adapters report HBR3 x4 as their maximum. With bandwidth
> allocation mode enabled, though, the tunnel's maximum is reported as
> UHBR20 x4, and i915 picks that up as the DPRX rate:
>
>   thunderbolt 0000:05:00.0: 0:13 <-> 1:12 (DP): DP IN maximum supported bandwidth 8100 Mb/s x4 = 25920 Mb/s
>   thunderbolt 0000:05:00.0: 0:13 <-> 1:12 (DP): DP OUT maximum supported bandwidth 8100 Mb/s x4 = 25920 Mb/s
>   thunderbolt 0000:05:00.0: 0:13 <-> 1:12 (DP): non-reduced bandwidth 8100 Mb/s x4 = 25920 Mb/s
>   thunderbolt 0000:05:00.0: 0:13 <-> 1:12 (DP): maximum bandwidth through allocation mode 20000 Mb/s x4 = 77575 Mb/s
>   thunderbolt 0000:05:00.0: 0:13 <-> 1:12 (DP): bandwidth allocation mode enabled
>   i915 0000:00:02.0: [drm:drm_dp_tunnel_enable_bw_alloc] [DPTUN 1:1:13][AUX USBC3/DDI TC3/PHY TC3] Enabling BW alloc mode: DPRX:20000x4 Group alloc:0/103500 Mb/s (Ok)
>
> The LTTPR (LTTPR 1) PHY capabilities read by i915 also flip between
> "04 03 00" and "04 00 00" around this point, i.e. its 128b/132b UHBR10/20
> bits come and go.
>
> i915 then tries 128b/132b, which always fails:
>
>   i915 [CONNECTOR:543:DP-3][ENCODER:542:DDI TC3/PHY TC3][DPRX] Max loop count reached
>   i915 ... [DPRX] 128b/132b Link Training failed at link rate = 2000000, lane count = 4
>   i915 ... [DPRX] 128b/132b Link Training failed at link rate = 2000000, lane count = 4
>   i915 ... [DPRX] Reducing link parameters from 4x2000000 to 4x1000000
>
> Two observed outcomes:
>
> 1. Cold boot with the dock attached: UHBR20 and UHBR10 fail, then i915 falls
>    back to HBR3, and 8b/10b training passes for both the LTTPR and the DPRX.
>    The monitors still stay black.
> 2. Dock hotplug: the fallback state is reset, and UHBR20 fails twice. The
>    limit drops to UHBR10, but there is no further training attempt, and
>    i915_display_info still shows port_clock=2000000 on all MST pipes. The
>    monitors stay black. On the hotplug path i915's modeset retry also hit a
>    WARN in snd_hda_spdif_ctls_unassign (from
>    intel_connector_modeset_retry_work_fn -> intel_audio_codec_disable).
>
> In about 12 boot/hotplug attempts on 7.3.3, the monitors came up once or twice.
>
> Workarounds that work on 7.3.3
> ------------------------------
> a) thunderbolt.bw_alloc_mode=0 on the kernel command line: no UHBR attempts,
>    training passes at HBR3 x4 on the first try at boot and after hotplug,
>    all monitors work, no i915 errors.
> b) With BW allocation mode left enabled, forcing HBR3 before any UHBR attempt
>    on the new link also works, and the forced rate survives later hotplugs:
>      echo 810000 > /sys/kernel/debug/dri/0000:00:02.0/DP-3/i915_dp_force_link_rate
>      echo 1      > /sys/kernel/debug/dri/0000:00:02.0/DP-3/i915_dp_force_link_retrain
>    Forcing 540000 the same way trained successfully but stayed black (needs
>    DSC at ~13 bpp for this monitor setup).
>
> So falling back to HBR3 after a failed UHBR attempt is not enough; HBR3 only
> works when UHBR is never attempted. My guess is that the failed 128b/132b
> training leaves the Barlow Ridge DP IN/OUT path or the dock's branch device in
> a state that 8b/10b retraining does not recover, but I can't verify that.
>
> On 7.2.15, i915 always reports i915_dp_max_link_rate=810000 for this
> connector and never logs a 128b/132b attempt or a link training error. I
> don't have drm.debug/thunderbolt dyndbg logs from 7.2, so I can't say whether
> 7.2 enabled BW allocation mode on this tunnel.
>
> Questions
> ---------
> - Should the tunnel's "maximum bandwidth through allocation mode" be capped
>   by the DP OUT adapter's maximum (HBR3 x4 here)?
> - Should i915 handle a failed UHBR attempt on this path differently, keeping
>   the fallback across hotplug and recovering after the 8b/10b fallback?
>
> I have full logs (drm.debug=0x10e thunderbolt.dyndbg=+p) for the bad boot,
> covering a cold boot, a hotplug, and both debugfs experiments, plus
> i915_display_info, i915_dp_mst_info and connector debugfs snapshots from 7.2.15
> and 7.3.3. I can test patches or a mainline build, and can bisect v7.2..v7.3
> if that helps.
> Download URL: https://drive.google.com/uc?export=download&id=1ZE5GYE69IgIpT6fWs5XHmMpseIurGgK8
>
> Thanks,
> Ron Rechenmacher

-- 
Jani Nikula, Intel
