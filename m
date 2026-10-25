Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792927800;
	b=C74zedbrbKPng6Iln/WZYTEHc0LOsiqOsTMutVjOLUFa/kTadkg2zZtV51cw14oAG92u
	 7PPyvNVnC9Wx+QA+4h95MuzyxG11CwvdpQrfDuROSTrbb46haPYJR/T/yTcVqggQ6uDl4
	 kxVHusQ4uKMtGxi20ODpC3WGbLbJq/yztffQoie8gI7/hNo1qYijpPBFZ8IQtC6jYeE4x
	 sA+eWC7G4S6McTVV4RoPgVifCplpGjVeC5vua0J0UIBAHFQJ7XaV2AFFMWjDVDJGlulCm
	 5uZ3txi5JB6mT5wZFq8rD/ZAFogHOfMrdn5ax/+HRLKYjxjbF892glVIGEJZ+tNjTZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792927800;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=SeUei4lk2acM03T61zgGWezRdSe2JGqKwEjzSwHpEys=;
	b=Vros6ZEmZhzBFpZfsh0eILtDry4hx5NUr69dwGA0jVmy3SnI5209o9RGy8I4zYbcNjDZ
	 zQHa4FS+XZr4tSqhC2AQ/bes7fa0d5/ZCGC5ktdkiyjyAPAcgPMIJmebUJ4Jb4/f1ERpX
	 Dc8aGnKv50523gzhKzjdUIMph8c8+TpRGcm+uds7HbiyLhCY/TkUroL68uSWvmZr4BflU
	 xy/YEOWU1K814DUEyB5QECzqMZVGdA9BVuwnLpwOf2fMujwiNq9KBG4IznWe5oMvt5knt
	 ue/+0c+QafqIeIVUeGyI2zxGEnWIHt8QP/LDZ4dv+i8/+38SIsBQgA4quJg5ROsmnDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crazyrussian.pro;
	spf=pass smtp.mailfrom=crazyrussian.pro;
	dkim=pass header.d=crazyrussian.pro header.i=@crazyrussian.pro header.a=rsa-sha256 header.s=protonmail2 header.b=w2UpKxCE;
	arc=none smtp.remote-ip=109.224.244.119
Received: from mail-244119.protonmail.ch (mail-244119.protonmail.ch [109.224.244.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74661606A31A
	for <regressions@lists.linux.dev>; Sun, 25 Oct 2026 11:29:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74661606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crazyrussian.pro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crazyrussian.pro
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=crazyrussian.pro header.i=@crazyrussian.pro header.a=rsa-sha256 header.s=protonmail2 header.b=w2UpKxCE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crazyrussian.pro;
	s=protonmail2; t=1792927796; x=1793186996;
	bh=SeUei4lk2acM03T61zgGWezRdSe2JGqKwEjzSwHpEys=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=w2UpKxCELbOSWjfNzoJjPedQcFiFA49KMh3kCwn4+mkO3vIJuAE0hhwJqh4Ey7ryV
	 NBOnA280WAQfPlTV0OT4w5HPx54ZNCGXr7e3KayKCkK+zsffRVTB7h2Cri8TT435RD
	 0rkAlMaCMHtJ8ZRYmAjHvTdXMCk6I5su31NNekld1E/N3i4BAubZlFW74Pw5xKsrxl
	 fNIntj3rmdhGT8c0sf5SlzYWSx8vz4AGOPtmf+KvXOQow4DgTd8ZkOl29KsLqOcopp
	 Tv6E0ag+BL8JWlwOf8VI0+eqMsrXd2rI4sU6qHuzCCpQ+ypTxCjfoyILB+KSIopbjB
	 EvOY43VpO7Idg==
Date: Sun, 25 Oct 2026 11:29:50 +0000
To: Oder Chiou <oder_chiou@realtek.com>, Mark Brown <broonie@kernel.org>
From: Egor Poderiagin <egor@crazyrussian.pro>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Matthew Schwartz <matthew.schwartz@linux.dev>, Pengpeng Hou <pengpeng@iscas.ac.cn>, bui duc phuc <phucduc.bui@gmail.com>, linux-sound@vger.kernel.org, regressions@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [REGRESSION] ASoC: rt721-sdca: runtime resume fails with -ENODATA since v7.3, jack PCMs cannot be opened
Message-ID: <8a12a2d9-1b56-4e00-8ccc-cf31325f8366@crazyrussian.pro>
Feedback-ID: 63178704:user:proton
X-Pm-Message-ID: ddf1cd611803a98ae83139abb28eb15db40a0e5f
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Since v7.3 the RT721 on my laptop fails to resume from runtime suspend
whenever its regcache went dirty while it was suspended. After a normal
boot it is already stuck by the time the desktop session starts. Every
later pm_runtime_get fails with -ENODATA, so the jack playback/capture
PCMs cannot be opened. PipeWire then drops the whole UCM HiFi profile,
which takes the (TAS2783) speakers down with it. With v7.2.11 audio
works.

#regzbot introduced: v7.2..v7.3

The failure is new in v7.3, but its cause is older. During the resume,
regcache_sync() replays register defaults that the codec answers with
Command_Ignored: PDE23 REQ_POWER_STATE in the regmap, and the volatile
0x2000046 in the MBQ regmap. v7.2.11 has the same defaults and most
likely hits the same writes, but it ignores the return value of
regcache_sync() (see "v7.2.11" below). 7a0886826308 ("ASoC: codecs:
rt721-sdca-sdw: Propagate regcache_sync() errors"), later simplified by
2df329044c61, makes the resume return that error. I have not bisected,
but that is the only change I can see that matches the traces.

Dropping those two defaults, plus the also volatile 0x6100006, from
rt721-sdca-sdw.h fixes it here (see "Tested fix" below).

Hardware / software
-------------------
  ASUS ProArt PX13 HN7306EAC, BIOS HN7306EAC.307
  AMD ACP 7.0 (PCI 1022:15e2 rev 70), SoundWire link 1:
    RT721    sdw:0:1:025d:0721:01      _ADR 0x000130025d072101
    TAS2783  sdw:0:1:0102:0000:01:8    _ADR 0x0001380102000001
    TAS2783  sdw:0:1:0102:0000:01:b    _ADR 0x00013b0102000001
  card: amd-soundwire, snd_acp_sdw_legacy_mach,
        components " cfg-amp:2 mic:acp-dmic cfg-mics:1 hs:rt721 spk:tas2783=
"
  The speakers are the two TAS2783s and the internal mics use the ACP
  PDM DMIC (acp-dmic), so of the RT721 only the jack is used.
  ACPI describes a single SDCA function for the RT721,
  \_SB_.PCI0.GPPA.ACP_.SDWC.SW22.AF01:
    acpi device:24: SDCA function UAJ (type 6) at 0x1
  There are no nodes for its mic array, HID or amp functions.
  kernel: openSUSE Tumbleweed 7.3.0-1-default (bad), 7.2.11-1-default (good=
)
  rt721-sdca is the stock in-tree module on both kernels, except for the
  tested fix below. Both use a local sof-soundwire/tas2783.conf UCM file
  (alsa-ucm-conf 1.2.16.1 has none), and the 7.2.11 boot also carries a
  backport of 173cb3147ba2 ("ASoC: tas2783-sdw: split a stereo stream
  across the two mono amps") as an out-of-tree module.

Symptom
-------
  $ aplay -D hw:CARD=3Damdsoundwire,DEV=3D0 -f S16_LE -r 48000 -c 2 -d 1 /d=
ev/zero
  aplay: main:850: audio open error: No data available

  rt721-sdca sdw:0:1:025d:0721:01: ASoC error (-61): at snd_soc_pcm_compone=
nt_pm_runtime_get() on sdw:0:1:025d:0721:01
   SDW1-PIN0-PLAYBACK-SimpleJack: ASoC error (-61): at __soc_pcm_open() on =
SDW1-PIN0-PLAYBACK-SimpleJack

/sys/bus/soundwire/devices/sdw:0:1:025d:0721:01/power/runtime_status
stays "suspended". Every later attempt, e.g. opening the PCM again, runs
the resume again and fails the same way. I have been rebooting to
recover.

Reproducer
----------
The failure needs the regcache to go dirty while the codec is
suspended. At boot I assume that is alsactl restoring the mixer after
the codec's 3 s autosuspend, but I have not traced the boot itself.
By hand (the switch is in the regmap, the volume in the MBQ regmap):

  P=3D/sys/bus/soundwire/devices/sdw:0:1:025d:0721:01/power
  echo auto > $P/control
  # wait for $P/runtime_status =3D=3D suspended
  amixer -c amdsoundwire cset name=3D'rt721 FU0F Capture Switch' off,off
  amixer -c amdsoundwire cset name=3D'rt721 FU0F Capture Switch' on,on
  amixer -c amdsoundwire cset name=3D'rt721 FU05 Playback Volume' 0,0
  amixer -c amdsoundwire cset name=3D'rt721 FU05 Playback Volume' 87,87  # =
previous value
  echo on > $P/control

Without the amixer steps, regcache_sync() writes nothing and the resume
succeeds.

Trace (stock v7.3)
------------------
regmap, regcache and rpm events. regmap_reg_write is only emitted for
writes that succeed, so the regmap_hw_write_* events are needed to see
the one that fails:

  rpm_resume: sdw:0:1:025d:0721:01 flags-0 cnt-1 ...
  regcache_sync: sdw:0:1:025d:0721:01 type=3Dmaple status=3Dstart
  (33 hardware writes, 202d ... 40880f80, all accepted)
  regmap_hw_write_start: sdw:0:1:025d:0721:01 reg=3D40981300 count=3D1
  regmap_hw_write_done: sdw:0:1:025d:0721:01 reg=3D40981300 count=3D1
  regmap_reg_write: sdw:0:1:025d:0721:01 reg=3D40981300 val=3D1
  regmap_hw_write_start: sdw:0:1:025d:0721:01 reg=3D41000309 count=3D1
  regmap_hw_write_done: sdw:0:1:025d:0721:01 reg=3D41000309 count=3D1
  regmap_hw_write_start: sdw:0:1:025d:0721:01 reg=3D4100030a count=3D1
  regmap_hw_write_done: sdw:0:1:025d:0721:01 reg=3D4100030a count=3D1
  regmap_hw_write_start: sdw:0:1:025d:0721:01 reg=3D41001188 count=3D1
  regmap_hw_write_done: sdw:0:1:025d:0721:01 reg=3D41001188 count=3D1
  regcache_sync: sdw:0:1:025d:0721:01 type=3Dmaple status=3Dstop
  rpm_status: sdw:0:1:025d:0721:01 status=3DRPM_SUSPENDED
  rpm_return_int: rpm_resume+0x317/0x730:sdw:0:1:025d:0721:01 ret=3D-61

0x41000309..0x4100030a and 0x41001188..0x4100118a are contiguous runs
in the cache, so the sync writes them through the raw path, one
register at a time (use_single_write). That is why they have no
regmap_reg_write lines. The raw write stops at the first error and
0x41001189 is never attempted, so the rejected write is

  0x41001188 =3D SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT_PDE23,
                            RT721_SDCA_CTL_REQ_POWER_STATE, 0)

The second resume attempt in the same trace (aplay opening the PCM)
fails on the same register. The sync of the first regmap aborts there,
and the MBQ regmap is never synced.

The driver never writes this control itself: its DAPM events set
REQ_POWER_STATE for PDE12, PDE2A, PDE40 and PDE41 only. It is in the
cache only because rt721_sdca_reg_defaults has an entry for it (0x03,
PS3). In the same sync, PS3 is accepted by PDE12, PDE40 and PDE2A, and
the amp function's FU06 mutes, written just before PDE23, are accepted
too.

MBQ regmap
----------
With the PDE23 default removed, the regmap sync completes, and the MBQ
sync then fails the resume:

  regcache_sync: sdw:0:1:025d:0721:01 type=3Dmaple status=3Dstart
  (21 regmap_reg_write lines, 100007 ... 200003c)
  regcache_sync: sdw:0:1:025d:0721:01 type=3Dmaple status=3Dstop
  rpm_return_int: rpm_resume+0x317/0x730:sdw:0:1:025d:0721:01 ret=3D-61

  rt721-sdca sdw:0:1:025d:0721:01: Defer on undeferrable control: 2000046

0x2000046 is the next MBQ cache entry after 0x200003c. It is listed in
rt721_sdca_mbq_volatile_register(), but it also has an entry in
rt721_sdca_mbq_defaults (0x3400), and the driver never writes it.
regcache_maple_sync() does not skip volatile registers, unlike
regcache_default_sync(), so the default is written back on every full
sync. 0x6100006 is in the same situation (volatile since v7.3, default
0x0000). I did not see it fail, because the sync never got past
0x2000046, but I dropped it too.

v7.2.11
-------
Same reproducer without the volume step, stock rt721-sdca, traced
before I added the regmap_hw_write_* events:

  regcache_sync: sdw:0:1:025d:0721:01 type=3Dmaple status=3Dstart
  (regmap_reg_write lines for the same 12 writes as on v7.3,
   202d ... 40981300)
  regcache_sync: sdw:0:1:025d:0721:01 type=3Dmaple status=3Dstop
  regcache_sync: sdw:0:1:025d:0721:01 type=3Dmaple status=3Dstart
  regcache_sync: sdw:0:1:025d:0721:01 type=3Dmaple status=3Dstop
  rpm_return_int: rpm_resume+0x317/0x730:sdw:0:1:025d:0721:01 ret=3D0

and aplay plays. The first sync is cut short here too. In a complete
sync (see "Tested fix"), the single registers after PDE23,
0x41081880 (CS31 SAMPLE_FREQ_INDEX) and 0x41380100 (OT23 VENDOR_DEF),
show up as regmap_reg_write, and here neither is written. The time from
the IT26 write (0x40981300) to the end of the sync, 420 us, also matches
the three writes up to and including PDE23 on v7.3 (463 us). So v7.2.11
most likely rejects the same write and just drops the error. The MBQ
sync had nothing to do in this run. 0x2000046 is volatile and has the
same 0x3400 default on v7.2.11, so I expect the same there, but I have
not seen it.

Tested fix
----------
Against v7.3, built as an out-of-tree module:

--- a/sound/soc/codecs/rt721-sdca-sdw.h
+++ b/sound/soc/codecs/rt721-sdca-sdw.h
@@ -63,8 +63,6 @@
 =09=09RT721_SDCA_CTL_FU_MUTE, CH_L), 0x01 },
 =09{ SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT_USER_FU06,
 =09=09RT721_SDCA_CTL_FU_MUTE, CH_R), 0x01 },
-=09{ SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT_PDE23,
-=09=09RT721_SDCA_CTL_REQ_POWER_STATE, 0), 0x03 },
 =09{ SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT_PDE23,
 =09=09RT721_SDCA_CTL_FU_MUTE, CH_01), 0x01 },
 =09{ SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT_PDE23,
@@ -86,12 +84,10 @@
 =09{ 0x2000003, 0x0000 },
 =09{ 0x2000013, 0x8001 },
 =09{ 0x200003c, 0x0000 },
-=09{ 0x2000046, 0x3400 },
 =09{ 0x5f00044, 0x6040 },
 =09{ 0x5f00045, 0x3333 },
 =09{ 0x5f00048, 0x0000 },
 =09{ 0x6100005, 0x0005 },
-=09{ 0x6100006, 0x0000 },
 =09{ 0x610000d, 0x0051 },
 =09{ 0x6100010, 0x0180 },
 =09{ 0x6100011, 0x0000 },

With it, the reproducer (both caches dirty) gives a regmap sync of 42
hardware writes and an MBQ sync of 77 writes, all accepted. The resume
returns 0, aplay plays, and there is no "Defer" warning. I also booted
normally without the workaround below. The RT721 runtime-suspends when
idle and resumes for jack playback and capture, the speakers and
headphones work, and so does system suspend/resume.

Notes
-----
- rt721_sdca_dev_suspend() only switches the regmaps to cache-only. On
  this board the link and both TAS2783 stay runtime-active and the
  RT721 stays Attached, so as far as I can tell the codec keeps its
  state across this suspend.
- The runtime resume does not call regcache_mark_dirty(), so
  no_sync_defaults is false and regcache_reg_needs_sync() returns true
  for every cached entry: the whole cache is replayed, defaults
  included. That is how controls the driver never wrote reach the
  hardware.
- tas2783-sdw had the same kind of abort, a replayed cache entry
  rejected with -ENODATA, fixed by 0c7aeb0f5ece ("ASoC: tas2783-sdw: do
  not treat read-only Controls as writable").
- Matthew's "[PATCH 5/5] ASoC: rt721-sdca: wait for PDEs to reach PS0
  after powering them up"
  (<20261016232416.2628603-6-matthew.schwartz@linux.dev>) changes the
  PDE power-up path, not the defaults or the resume, and does not
  conflict with the change above. His ROG Xbox Ally X20 is also an ACP70
  machine with an RT721 and TAS2783s, so it may hit the same failure.

I can send the change above as a proper patch if the approach is
acceptable. Realtek will know whether PDE23 REQ_POWER_STATE should be
writable on this part, given that ACPI only describes the UAJ function,
and whether other defaults have the same problem on other boards.
Simply treating Command_Ignored as non-fatal again would bring back the
v7.2.11 behaviour, where everything after the rejected write silently
goes unrestored.

The ASoC pull for v7.4 makes more codecs return cache sync errors from
resume, so any driver whose defaults the hardware rejects will fail the
same way. Should regcache_maple_sync() skip volatile registers, as
regcache_default_sync() does? That would cover the 0x2000046 part for
every driver. It is unchanged in regmap for-next.

Workaround
----------
Without the fix, forbidding runtime PM for the codec avoids the failing
resume. I used this udev rule:

  ACTION=3D=3D"add", SUBSYSTEM=3D=3D"soundwire", KERNEL=3D=3D"sdw:*:025d:07=
21:*", ATTR{power/control}=3D"on"

With it the RT721 stays active from boot, and the HiFi profile is back
with its Speaker and Headphones sinks. The cost looks small on this
machine. The RT721's runtime suspend only switches its regmaps to
cache-only, and the link cannot suspend while either TAS2783 is active.
During one 26-minute boot, one of the TAS2783s was runtime-suspended
for only 1 s in total, and amd_sdw_manager.1 never suspended at all.
I have not measured power.

Thanks,
Egor Poderiagin

