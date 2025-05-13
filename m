Received: from sonic320-25.consmr.mail.gq1.yahoo.com (sonic320-25.consmr.mail.gq1.yahoo.com [98.137.70.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F219D28643D
	for <regressions@lists.linux.dev>; Tue, 13 May 2025 10:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=98.137.70.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747133753; cv=none; b=toKcZxHUPoPyUHVlCBAfFdlFnBl+k7VnApFOkjdZtl5SZQmjefARKOPHj6WH+zajAC0F4TZ61uJoY8iFRNbUV6dnYcO97X0BBZvvrB3GNo6L1UJ770utG7WeI9pNuDFuzTT1UQhyp34ro+plHzfGN6jt/XIFehXm03QKiz2Qdl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747133753; c=relaxed/simple;
	bh=1N5n4Ne/priTrec8JXqgsUH8AQ8N52bIA6M0x84onTM=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=ci7c5ERjOPGPaNWvADUp+dUq73e1pdmh5CisbZCKh22nwCnKVB6S/82uFwYBQfQpRS4QOMO4Teqexa+EfuoukfJhgmj3gmRZf4+QsCQBtGcgTghUNQqPEz81TvS7OQHqKSiKCfwdDB8BIBbqEflO/O39dMsmNECyhmiZywrI2V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=YQk0sJ6x; arc=none smtp.client-ip=98.137.70.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="YQk0sJ6x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747133751; bh=1N5n4Ne/priTrec8JXqgsUH8AQ8N52bIA6M0x84onTM=; h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To; b=YQk0sJ6xtJK0gcG3aih4plunKxIaT26tJkVMhrY0doBe9Gk8aS1HdS6UgXCPNuJCAUjooz5FwUqLopqia4GdWFj8h0z4iQedJM9bPi08Tdiw0NwogwX+xo99If8ApLeFDkqpWvuKWlKR0YUllKLfj6v8FMBU7dqKIsVTP/XhlL7iGBcQ5/e28eXWk/luLzEIajTodLeMUCBH4+S0IkYDcNwh+R3gSc8MnRWOr3c9EKM7/9TUpCmEVoFIagN97xkGD/DpfH6dPLr6cohr0iL6+n20EE9uY/8LwUdtpLiWYS24cGAqPzY30dGF6bjD7MWr4UZKfbFRHNpoOtirvcdCxA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747133751; bh=bQUnRV/IPZ9A1m/nWwHjDlqYxovdZunWhsTLoPTTX2x=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=Fz5Jlg2TfZMajWA+bvNG6k7LEswCYqHRFKvAlhKDXJcyZnX1zfeKAKmTzwXT0eiN2RdD4qq2/zHQNen7T+wNNXzQagcyFo0rtoYmZbFJUOi3325Fijdqu/Q7G25yyzLcbxdGiWqldN+pEJwQm4nbZC0ks+Q550qiAtaVAQfATnDvhzIXQeTFfC4wFM1DVGFVOPRHrp7839qfR97Po2vb3+ie5My7mwMl+PXs5mtKzTYTPkQ8c3brKeJc24npYG5SlwUiogVUqrRAd9QG0+zzc4uqswHJyWFGJAoL+jA95JvBRmfi1NPqdIVrZEiVLtBLIbZ365cQEckCGS0am2pAqQ==
X-YMail-OSG: q5.tnk8VM1kyBSzaahFqrI_taA.VpNe0QSLdUzeVcV9ZiHHshe_Ll4YhVctU7sd
 QIiHovHryjyi3xqRGZvZSQHA.ApuTiMQjzqO.E5tAn_oLSrbW.ZGUQEbDuyoQD_cyXJTY.OkHmKZ
 VENx04fIUY4j.PxN0xE4aWDN.wZ4rov0t4DPnZiaGTQvKXQNJa521D6umOL6WMnudVIViLPYNt3L
 N9zIVW_FGo6pEo3JVPhZXFp1jJmHncg2zOVxoBtwSziTzb5zdWO1tgNShDlEDXum5nS93WYNrarq
 v0kNs_5TcbFKZPtn_VIg8io4mL6Pez5fRjV_lq8RibNsd6qP6cTI0Ms7TBlN3pJo.GCyRfyWx9_d
 VwRsOZNbFbS1eVvXVpkqZVhJHU9aFei0.H9sU8G9j9tkdcrXOQdsd9sXj_fHGK9mbRo3P_DlEwJR
 ClRS0aB94ezQQ3CBa1QYaKt2gOSdaDyQoLJJx3Prv4I61fic5W62j64mPJVZL_9Oo2D4lc4n4wcq
 ACL_F11nG0zqne8S5CqlwyrV0niuKmpulQZgS5Zsozum3lF8Y9e79ABENl6BjaW678C7BiamuW71
 Y6ZSSHc.P0qLv5EeA8M9bFsnfFoZBvcyJRsg_NaMbJg2W6OufAuRWE8pNx5QNlzaQJYUlWs1JwVy
 SRqr60LIzauIFxXlL4w1kEdvpN1qTNnhz56jzeMw8M7PGZ_nF6n2mVeE2DqkWEiDNtj2JB1Egc1L
 RPOttSkuleYwybNReToGtapQGbZ7Kac2Hmg.ACMNFPLanZ.8X23bHI1WuOmV1WVUR2iCP74g1TGU
 21F6IDLcMPR9tjs44e_oQaWen41244RxHS1gHRn.C4H.iqcZIjM0roR0LGyeIovOpvQ6m18TtnNL
 8Uc68ZMN.IOFv8KV0pQVLe2i09FpvdkRiwTlb4G_aDraIeHE.yaLbVXEV1BxTWUIVodldJ3xuM1G
 zm8MQ5az3GF3O6qjMR7hIDlK2zWGfZN1Wwn9YpZmxBZWsskub_Fo0HdhWizlqiSnlKcdSPuc.aK7
 PaqEn2VZpgMdBT0eR4wgmRatUSbB0sAfGLl0uWSrO82TIT7uhMOcjh5FZQL94_W73eIHxloNG4PE
 hqSECHDp5k9Ylor9smBrTLYFQmSFjWU6t2_8waRG7ttFZIc3UXU6eMmP9oXMPQ3qG62tjG89F51.
 koc3dVCS7638MHKkjCwxesgMLFKn_GTt4THJMTUaJTBuX8qQm.5l.ZhIq9ApukeODqWnSw2RF8j8
 _CvG0aqK9vSxSKieVDiLHQldDU9RGS3BsC2Tx9CIjppfQ_Gar4O2DSU9gINr0wKqLCDIWSJxa67G
 uqzXlOraCIMx_KeHi6Ux2pzps0vQkOvwYlsHPjW0u88oqNxOw0LYSJ_fE3gYnz4slnGlu5PkeIjF
 SNjYM.Fp_eV7DDiUKhd7UtcS.PcMESYwJmmHYY8VvfWsqQLHv41RumTs_6uvY8AAdlf6mQn4oun_
 BvrM_OEhdVwR50TYAEDeuVgG814u0YaWHRer6yejNcMk5qcsJASodIRGO1ifPQUdAb6nFdL8sfw1
 IneUJH024PnsS2aCp.O6wxdXUPv569sFptyU.mPilRHg8uQuz3XZ29u_6nMjjRisuVUzi7rhOoi8
 hQQPQpFQ5i6RccHYIP5JP2fDxG2Ti7ui9kwkDWsy.bvcWi0YoRY9eqBahMCcVp82M1OAYHDirvrT
 PKKRvVra9TBCVAdgg0OvSypPy5f9.sVVVCB4Ma.QT2t64hyo7xZdOZZFnqfl.bsKw29yiAWT8fAm
 VGWRDEw8aIccJpp2jOSVtfSgGNHE1zRY4nGKMNNFruFqRkJ2UIeT.Vpa5MwBwxOtVGa2GZtZc8_W
 dblzuTfNxsBXQVY7v.J4zFD7qrYG1Tcfiu5o0my8dkhvgpUO.IDMn2DSYZOHN07bH0N65zZQphTB
 mrBX1coYDPCybjCTM98uyAYPCwuzawBzgCLAhFqo.1CdKKfUFrh1qCiE4C1TOX5OTHFfEfM6qRN3
 PHF6GxKJao7AnX8vp7cfL0Vkjiv8Y_qAMPrn8fnQyK4aBDlKrsSHoriQZeqE3rggdvnCF3feEHiV
 vqSWPuemTiRXn6JQBqZwYKTW0yR8piwKdo.EvkIaRpQffZxmdlapGb9eHF25pSpqE1lYrm.EA52B
 1dlxENhtvfnfmSVxodlPqfrfPRM5aMJgO4EbJv82q4OrbHTCEkqqDOoJL8VhmH_ettlHnQHPbKzx
 .x2l8vyNPpzxIGxtV_U22B.Rm6zjjvMheGCuIpzy6E4FZAw--
X-Sonic-MF: <nruslan_devel@yahoo.com>
X-Sonic-ID: 98f42dff-1773-47bb-9c4f-da1ca83ff38f
Received: from sonic.gate.mail.ne1.yahoo.com by sonic320.consmr.mail.gq1.yahoo.com with HTTP; Tue, 13 May 2025 10:55:51 +0000
Date: Tue, 13 May 2025 10:25:28 +0000 (UTC)
From: Ruslan Nikolaev <nruslan_devel@yahoo.com>
To: "bugzilla-daemon@kernel.org" <bugzilla-daemon@kernel.org>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>, 
	kailang@realtek.com, tiwai@suse.com, alsa-devel@alsa-project.org, 
	sashal@kernel.org, "perex@perex.cz" <perex@perex.cz>
Message-ID: <362743264.827582.1747131928735@mail.yahoo.com>
In-Reply-To: <bug-220109-229339-9HzhKc5gL2@https.bugzilla.kernel.org/>
References: <bug-220109-229339@https.bugzilla.kernel.org/> <bug-220109-229339-9HzhKc5gL2@https.bugzilla.kernel.org/>
Subject: Re: [Bug 220109] Audio disappears on HP 15-fc000 after warm boot
 again (ALC256 code path)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.23772 YMailNovation

Kailiang,

I added alsa-info outputs to=C2=A0https://bugzilla.kernel.org/show_bug.cgi?=
id=3D220109 (see attachments for both the regression and reverted changes) =
by following your instructions.
Please let me know if there is any other information you need.


Thanks,
Ruslan



On Tuesday, May 13, 2025 at 02:30:17 AM EDT, <bugzilla-daemon@kernel.org> w=
rote:=20





https://bugzilla.kernel.org/show_bug.cgi?id=3D220109

Kailiang Yang (kailang@realtek.com) changed:

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 What=C2=A0 =C2=A0 |Removed=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |Added
---------------------------------------------------------------------------=
-
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CC|=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |kailang@realtek.com

--- Comment #3 from Kailiang Yang (kailang@realtek.com) ---

Could you run alsa-info.sh to dump codec info?

Please do =3D=3D> echo 1=C2=A0 > /sys/module/snd_hda_codec/parameters/dump_=
coef

before do alsa-info.sh.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are on the CC list for the bug.
You reported the bug.
