Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5565C7F
	for <regressions@lists.linux.dev>; Wed,  4 Jan 2023 02:18:42 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id o1-20020a17090a678100b00219cf69e5f0so37637783pjj.2
        for <regressions@lists.linux.dev>; Tue, 03 Jan 2023 18:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g7cxvg7pQB/ko5IQ5wHDjOmOsi3nY0t4ZewVoK7/UyA=;
        b=C6IrKuOgSaFLZsT1AupbyapFB0zc+uSkNJ6hkydDRHbTZEALZfasUCBfrx07ilL9VI
         26gjXcOtQ6Bx7MzTtKUr/BVXMjmFvf8429C5mxyJ4+dn1JNtPlY4pJT2KXQXe7YZjBEb
         vi5+vUKq30H1Sd3oxpZtozmJhv1gAsOssU6L6scIqvyas/G8rlZHzoJxvFilawvJ3r/1
         A5+GoOoyRGpXy1Gg6oT4EiLrMfdLhRkV1pM3HYGL3Utnxg07SAUc5SYrgTanzZsAz2RH
         PgYH/g6wX5ubtQBWwcKsref7UFNCNm/LOl364NQD3jwAc1QToOnk5W9RbDdXO5HVh75w
         M1Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g7cxvg7pQB/ko5IQ5wHDjOmOsi3nY0t4ZewVoK7/UyA=;
        b=lM2TQT23dmJnakYlITz56prGwx6e+9YqNjjrwTEimJC78gnXT1Zv5AFHJv74kEiPU4
         T3r0CVr4a3SmkLh+yvFAorOl4Zm85eTIQTmz6hSQt7AFkMg5Xta46ZhVqWU/6eT5XBe+
         7mPxaukzX9z+LU5YHFsaWYBmLlvxHOVoSk2cReyCHCAlRzEjqn9uK/Fdv5IVc1FyrvNe
         KJd2hITsE+fzTBk3DKWlBffBXMRRxsetaMSktU0npLHX2gC7I5dcwtU3LX/raqLfVfbt
         LjLQy7gZmoIptJsASzZxRO3sTLZR+q3bAdidHjicTty3G9KBUhoY/SPMCfpqk4LiwTrl
         lc5g==
X-Gm-Message-State: AFqh2kohEe5FRHMgOa5JEn1/FKX+ma36gekhF10gX3YRU15KQAdqEhsZ
	rZyL9UW/EaNPfID4DVUsxwHBfm0dH6w=
X-Google-Smtp-Source: AMrXdXvQpcAurGmTyDrBIL9h4B697wm/d1jfsU7hQV7PXw2xWT3v3UWcWd0Pp8h7LhuPEuiUJa6MaA==
X-Received: by 2002:a17:902:edd1:b0:192:50fe:504a with SMTP id q17-20020a170902edd100b0019250fe504amr44649534plk.16.1672798721391;
        Tue, 03 Jan 2023 18:18:41 -0800 (PST)
Received: from debian.me (subs03-180-214-233-71.three.co.id. [180.214.233.71])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902e74400b00176dc67df44sm22964297plf.132.2023.01.03.18.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 18:18:40 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
	id 94DCB103667; Wed,  4 Jan 2023 09:18:37 +0700 (WIB)
Date: Wed, 4 Jan 2023 09:18:37 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Waldek Andrukiewicz <waldek.social@pm.me>, stable@vger.kernel.org
Cc: regressions@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: i2c-CLSA0100:00-cs35l41-hda.1: System Suspend not supported
Message-ID: <Y7Th/Wu01q7DuAO4@debian.me>
References: <e6751ac2-34f3-d13f-13db-8174fade8308@pm.me>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="buc/xK794qEOh3Gn"
Content-Disposition: inline
In-Reply-To: <e6751ac2-34f3-d13f-13db-8174fade8308@pm.me>


--buc/xK794qEOh3Gn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 03, 2023 at 08:45:05PM +0000, Waldek Andrukiewicz wrote:
> Hello,
>=20
> I am running Manjaro, after upgrading from kernel 6.0.15 to 6.1.1
> (https://gitlab.manjaro.org/packages/core/linux61) I have noticed that
> suspend stopped working, what I can see in the logs is the following
> issue which IMO points to cs35l41
>=20
> Machine:
>  =C2=A0 Type: Laptop System: LENOVO product: 82N6 v: Legion 7 16ACHg6
>=20
> journalctl output below:
>=20
> Jan 02 21:52:54 legion16 systemd[1]: Starting System Suspend...
> Jan 02 21:52:54 legion16 wpa_supplicant[1193]: wlp4s0:
> CTRL-EVENT-DSCP-POLICY clear_all
> Jan 02 21:52:54 legion16 systemd-sleep[2912]: Entering sleep state
> 'suspend'...
> Jan 02 21:52:54 legion16 kernel: PM: suspend entry (deep)
> Jan 02 21:52:54 legion16 kernel: Filesystems sync: 0.008 seconds
> Jan 02 21:52:54 legion16 wpa_supplicant[1193]: wlp4s0:
> CTRL-EVENT-DSCP-POLICY clear_all
> Jan 02 21:52:54 legion16 wpa_supplicant[1193]: nl80211: deinit
> ifname=3Dwlp4s0 disabled_11b_rates=3D0
> Jan 02 21:52:54 legion16 plasmashell[1770]: qml: [DEBUG] - onNewData
> Jan 02 21:52:54 legion16 kernel: Freezing user space processes ...
> (elapsed 0.002 seconds) done.
> Jan 02 21:52:54 legion16 kernel: OOM killer disabled.
> Jan 02 21:52:54 legion16 kernel: Freezing remaining freezable tasks ...
> (elapsed 0.001 seconds) done.
> Jan 02 21:52:54 legion16 kernel: printk: Suspending console(s) (use
> no_console_suspend to debug)
> Jan 02 21:52:54 legion16 kernel: cs35l41-hda
> i2c-CLSA0100:00-cs35l41-hda.1: System Suspend not supported
> Jan 02 21:52:54 legion16 kernel: cs35l41-hda
> i2c-CLSA0100:00-cs35l41-hda.0: System Suspend not supported
> Jan 02 21:52:54 legion16 kernel: cs35l41-hda
> i2c-CLSA0100:00-cs35l41-hda.1: PM: dpm_run_callback():
> cs35l41_system_suspend+0x0/0xd0 [snd_hda_scodec_cs35l41] returns -22
> Jan 02 21:52:54 legion16 kernel: cs35l41-hda
> i2c-CLSA0100:00-cs35l41-hda.0: PM: dpm_run_callback():
> cs35l41_system_suspend+0x0/0xd0 [snd_hda_scodec_cs35l41] returns -22
> Jan 02 21:52:54 legion16 kernel: cs35l41-hda
> i2c-CLSA0100:00-cs35l41-hda.1: PM: failed to suspend async: error -22
> Jan 02 21:52:54 legion16 kernel: cs35l41-hda
> i2c-CLSA0100:00-cs35l41-hda.0: PM: failed to suspend async: error -22
> Jan 02 21:52:54 legion16 kernel: PM: Some devices failed to suspend, or
> early wake event detected
> Jan 02 21:52:54 legion16 kernel: OOM killer enabled.
> Jan 02 21:52:54 legion16 kernel: Restarting tasks ... done.
> Jan 02 21:52:54 legion16 kernel: random: crng reseeded on system resumpti=
on
> Jan 02 21:52:54 legion16 syncthing[1588]: [RBC2R] INFO: Relay listener
> (dynamic+https://relays.syncthing.net/endpoint) shutting down
> Jan 02 21:52:54 legion16 syncthing[1588]: [RBC2R] INFO:
> listenerSupervisor@dynamic+https://relays.syncthing.net/endpoint:
> service dynamic+https://relays.syncthing.net/endpoint failed: could not
> find a connectable relay
> Jan 02 21:52:54 legion16 syncthing[1588]: [RBC2R] INFO: Relay listener
> (dynamic+https://relays.syncthing.net/endpoint) starting
> Jan 02 21:52:54 legion16 syncthing[1588]: [RBC2R] INFO: Relay listener
> (dynamic+https://relays.syncthing.net/endpoint) shutting down
> Jan 02 21:52:54 legion16 syncthing[1588]: [RBC2R] INFO:
> listenerSupervisor@dynamic+https://relays.syncthing.net/endpoint:
> service dynamic+https://relays.syncthing.net/endpoint failed: Get
> "https://relays.syncthing.net/endpoint": dial tcp: lookup
> relays.syncthing.net on [::1]:53: read udp [::1]:58193->[::1]:53: read:
> connection refused
> Jan 02 21:52:54 legion16 syncthing[1588]: [RBC2R] INFO: Relay listener
> (dynamic+https://relays.syncthing.net/endpoint) starting
> Jan 02 21:52:54 legion16 syncthing[1588]: [RBC2R] INFO: Relay listener
> (dynamic+https://relays.syncthing.net/endpoint) shutting down
> Jan 02 21:52:54 legion16 syncthing[1588]: [RBC2R] INFO:
> listenerSupervisor@dynamic+https://relays.syncthing.net/endpoint:
> service dynamic+https://relays.syncthing.net/endpoint failed: Get
> "https://relays.syncthing.net/endpoint": dial tcp: lookup
> relays.syncthing.net on [::1]:53: read udp [::1]:35430->[::1]:53: read:
> connection refused
> Jan 02 21:52:55 legion16 bluetoothd[942]: Controller resume with wake
> event 0x0
> Jan 02 21:52:55 legion16 kernel: PM: suspend exit
> Jan 02 21:52:55 legion16 kernel: PM: suspend entry (s2idle)
> Jan 02 21:52:55 legion16 kernel: Filesystems sync: 0.004 seconds
> Jan 02 21:52:55 legion16 kernel: Freezing user space processes ...
> (elapsed 0.001 seconds) done.
> Jan 02 21:52:55 legion16 kernel: OOM killer disabled.
> Jan 02 21:52:55 legion16 kernel: Freezing remaining freezable tasks ...
> (elapsed 0.216 seconds) done.
> Jan 02 21:52:55 legion16 kernel: printk: Suspending console(s) (use
> no_console_suspend to debug)
> Jan 02 21:52:55 legion16 kernel: cs35l41-hda
> i2c-CLSA0100:00-cs35l41-hda.1: System Suspend not supported
> Jan 02 21:52:55 legion16 kernel: cs35l41-hda
> i2c-CLSA0100:00-cs35l41-hda.1: PM: dpm_run_callback():
> cs35l41_system_suspend+0x0/0xd0 [snd_hda_scodec_cs35l41] returns -22
> Jan 02 21:52:55 legion16 kernel: cs35l41-hda
> i2c-CLSA0100:00-cs35l41-hda.1: PM: failed to suspend async: error -22
> Jan 02 21:52:55 legion16 kernel: PM: Some devices failed to suspend, or
> early wake event detected
> Jan 02 21:52:55 legion16 kernel: OOM killer enabled.
> Jan 02 21:52:55 legion16 plasmashell[1770]: qml: [DEBUG] - onNewData
> Jan 02 21:52:55 legion16 kernel: Restarting tasks ... done.
> Jan 02 21:52:55 legion16 kernel: random: crng reseeded on system resumpti=
on
> Jan 02 21:52:55 legion16 systemd-sleep[2912]: Failed to put system to
> sleep. System resumed again: Invalid argument
> Jan 02 21:52:55 legion16 kernel: PM: suspend exit
> Jan 02 21:52:55 legion16 bluetoothd[942]: Controller resume with wake
> event 0x0
> Jan 02 21:52:55 legion16 systemd[1]: systemd-suspend.service: Main
> process exited, code=3Dexited, status=3D1/FAILURE
> Jan 02 21:52:55 legion16 systemd[1]: systemd-suspend.service: Failed
> with result 'exit-code'.
> Jan 02 21:52:55 legion16 systemd[1]: Failed to start System Suspend.
> Jan 02 21:52:55 legion16 systemd[1]: Dependency failed for Suspend.
>=20
> I have to admit I have not tried 6.1.2 yet but I could not find any
> changes related to this module (opposite to 6.1 where there was quite a
> few including suspend - commit dca45efbe3c870a4ad2107fe625109b3765c0fea).
>=20

Can you please try building mainline (Linus's tree) and boot from it?
If the suspend success in the mainline, can you also bisect to find the
culprit?

In any case, I'm adding this to regzbot:

#regzbot ^introduced v6.0..v6.1
#regzbot title Suspend not supported on Lenovo Legion 7 since v6.1

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--buc/xK794qEOh3Gn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY7Th9QAKCRD2uYlJVVFO
o5J8AP92Q8ES1Cr5Ut9OaSyQpTvgbfXGV3/SBwsqAE3OfgM4rAEAjuXGfDmHYr5n
3Q/sZkBDJPKyqnF2yJiUExeXDc65Mww=
=sFpl
-----END PGP SIGNATURE-----

--buc/xK794qEOh3Gn--
