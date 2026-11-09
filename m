Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794262122;
	b=yshKag8H5msHqTz475Hg4L6d0b1M91/neRHo7FCLKsiho+EmprpcsX3Vv1N+f0aoZ7SY
	 8R8aXDfKtDGO4HLJDhsu9gY99S1MpfOWbjGMjuQORJoihzLCdUqGA0iOts3umiiiiqynq
	 6S7stDAidQPmobcn/HA9j2Z5Ho9703n7us+w6CbDqbUGO+yOmGbKzltBwCHqYRY2er54v
	 V+159QH2C7ki9GQ32JwG1s/KHYq5XrqlqNkdTaEfeDdJvZ8yLgt+XgX68Jlv2cBiJkaEi
	 Zp2xerZaXCFjI3wU65AVoBSjtlbWDE0xHnHFRmT/UJnm/QwZ5tGyU532jAHjdo951iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794262122;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=XVVNjsYgvnBOh8ZURbMg3/YTXa9auR1rfDCGN1FNfCk=;
	b=KH48U96KN9YPv2jQ9EEhmM5GPF/OPfB02J0L/bgowdIEO/6oKpCGtgV5v78tFEqD1gIX
	 qzrk20Bzw1eeltARusSAPlK9jADcbpFRJI9c0Zb81uEEirukq0e6z6WWjN7oT2PBfIDB7
	 sw/YZAa0Zc9SkOLEqvLE6+8RshENLsbI8/xQvQzWlZ9dNkzMYCj01/czpL1vrcVV+buJs
	 QvRcJVnSdhaJoCSqS8R00nCRy1k0SJsk4zitZJ0G4rQgo9IsiD+dDfijHkgna4pMhevQ7
	 5wGg8BT7nDuXMbTBngugX7ATEMzSBlzCLY3iqlrsEvM+QJ4xzATxZoTygRADsHwXGWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=RIyRzaay;
	arc=none smtp.remote-ip=79.135.106.101
Received: from mail-106101.protonmail.ch (mail-106101.protonmail.ch [79.135.106.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F33606A321
	for <regressions@lists.linux.dev>; Mon,  9 Nov 2026 22:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3F33606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=RIyRzaay
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794262118; x=1794521318;
	bh=XVVNjsYgvnBOh8ZURbMg3/YTXa9auR1rfDCGN1FNfCk=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=RIyRzaayNIA9o7R+W6KU8rJOKO0ku8tm1jkhKOXKmU6DHBuikXszVXGXknOD2tUkx
	 7F7iTEqdMou/0oF/9tKItWtLPIYdxvXCUsC4a/9FnLtXb/mwZT76syKoqHrQgHSJDi
	 Y7DmSa6Zht7BXPUpgFdl9YQnU1ciNBMhibB6JZceUQWKwr0sKqcwZunHmpIzdQ+pvp
	 S1059AsrMcNRr6wok6aFT1UBpjTC6xoJgaGzShx1tRidKIz6zYb/cjpK3lHopnGkRx
	 bee1BNo12Vvoy+WlN2Zs9Wtj7LwfFvqjwPdHCZ9C7T06G3d1dikC5BW6hMq5rfpleG
	 DHd3rvB/DqGhw==
Date: Mon, 09 Nov 2026 22:08:34 +0000
To: Linux Sound System <linux-sound@vger.kernel.org>
From: Rujbin <rujbin@proton.me>
Cc: "broonie@kernel.org" <broonie@kernel.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "kees@kernel.org" <kees@kernel.org>, "regressions@lists.linux.dev" <regressions@lists.linux.dev>, "linux@leemhuis.info" <linux@leemhuis.info>
Subject: [PATCH] ASoC: soc-core: reset num_components after flex alloc
Message-ID: <GkiJToEzZhJCPGLofG5evJYV9SQ_rihb4enHtttMHWBS2rm3CBbL1IUumkGqnP3FNceQ0k6MIX2GWUtgmJWOTFp-bPCae4XiTB4Lrsz-Pd8=@proton.me>
Feedback-ID: 45446246:user:proton
X-Pm-Message-ID: 71ab0d0a49b56e6132a46012e6937645073633fc
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

devm_kzalloc_flex() calls __set_flex_counter(), which sets the
__counted_by() counter of a flexible array member to the number of
allocated elements. In soc_new_pcm_runtime() that counter is
rtd->num_components, but ASoC uses it as the number of populated
components, not as the allocation size.

With a compiler providing __builtin_counted_by_ref (GCC >=3D 15,
Clang >=3D 19) and CONFIG_CC_HAS_COUNTED_BY=3Dy, the counter is therefore
left at num_cpus + num_codecs + num_platforms after the allocation.
For the "Analog Playback and Capture" link of skl_hda_dsp_generic that
value is 3, so the first snd_soc_rtd_add_component() writes to
components[3], past the end of the allocated array. Because
for_each_rtd_components() stops at the first (zeroed, NULL) entry, no
components are ever found, DAPM route setup fails with -ENODEV
("ASoC: Failed to add route ...", "fail to add hda routes, ret -19")
and the card is not registered.

Reset the counter to zero right after allocation. The existing
increment-before-store pattern in snd_soc_rtd_add_component() keeps
the __counted_by() bounds checks satisfied, and there are no other
direct rtd->components[] accesses under sound/.

Only kernels built with a compiler supporting __builtin_counted_by_ref
are affected; with older compilers __set_flex_counter() is a no-op and
kzalloc leaves the counter at zero. No released kernel is affected:
the conversion landed in 7.4-rc2.

Tested on Intel Meteor Lake-P with GCC 16.2.1. Replacing
snd-soc-core.ko in v7.4-rc2 restores the sof-hda-dsp sound card and
eliminates the ASoC route initialization errors.

Fixes: 4dd10fbbeb9c ("treewide: Convert devm_kmalloc() family to the devm_k=
malloc_obj() family")
Signed-off-by: Rujbin Nassereslam <rujbin@proton.me>
---
 sound/soc/soc-core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 68b54e5..faf279c 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -388,6 +388,15 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime=
(
 =09=09return NULL;
 =09}
=20
+=09/*
+=09 * devm_kzalloc_flex() sets the __counted_by() counter to the number
+=09 * of allocated elements, but ASoC uses num_components as the number
+=09 * of populated components. It has to start at zero here, otherwise
+=09 * snd_soc_rtd_add_component() writes past the allocated array and
+=09 * for_each_rtd_components() stops at the first (empty) entry.
+=09 */
+=09rtd->num_components =3D 0;
+
 =09rtd->dev =3D dev;
 =09INIT_LIST_HEAD(&rtd->list);
 =09for_each_pcm_streams(stream) {
--=20
2.56.0
