Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28B88C04
	for <regressions@lists.linux.dev>; Tue, 31 Jan 2023 15:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675178189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=57w4K6BuoaTjEUzcJkzqKflKFYan8jU60ULxR7+D950=;
	b=P7ew7q8YreyCCX3gEtH4w/9eM5Ytbu5T3HQ7Yp4iwaikOqNMnYMcF1rhCLSJzEzeR+BVUZ
	7xf3hDA7V2nMNvJGmPiQXt6jY8cK1i3BapjvdqSuTZUFJO91cFtOdOLSKdc3mDUk20MXp2
	/9uoefVxyXCPP09l9tHsDnKAkFpa6OE=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-523-cemb08V-P_2UWq2EcBZg7Q-1; Tue, 31 Jan 2023 10:16:22 -0500
X-MC-Unique: cemb08V-P_2UWq2EcBZg7Q-1
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-5063c0b909eso167889317b3.7
        for <regressions@lists.linux.dev>; Tue, 31 Jan 2023 07:16:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=57w4K6BuoaTjEUzcJkzqKflKFYan8jU60ULxR7+D950=;
        b=hTaYDq60+l8+9owcTIRNDSMhJB04jguoabxm1TVpOnnC1ODfSRSPfxrSU74e6lg2L/
         Jx31ud6G7WiIS7ZIyOCiLnJ+0xRZgpOWBLL+x0UnQ4QvonKoVd+cWF872x+22lpy0/d3
         aw1tsrU60gboG87rUxapG/Y0HGcHTGk70GTsaWy09QaOJpaVWDFAtdQj7chUJhxgL+vc
         mYhFXf14o3sG193jz+MFHwUAOJ4gqJy8Igl/ytynCUI9TM/tzHducTtiRiYIExZUuduY
         5rUFhNQg80MmRwgu0UIQGNd550ky7w9/UwiKhySNcKtxgObyNvYKuEhuDquwUPvLIFgz
         Bqww==
X-Gm-Message-State: AO0yUKUmI9U3PLCSOyFvOWAvH2nQGq0utUW8p5NbhvYdQpR1Ri3Y8vj/
	0BAiyq/KOWypTIo4ySU9dRMooQ4qkTScLPaTVKYZirCVPNT56g0MZm/GU/ZEV8Jz17gBvpvVqJm
	yIQixt8l+FsvJ+wwEVOiQjw9eHS2Rc2DKMPjhaU8=
X-Received: by 2002:a0d:eb0b:0:b0:506:5637:b000 with SMTP id u11-20020a0deb0b000000b005065637b000mr2939969ywe.461.1675178176361;
        Tue, 31 Jan 2023 07:16:16 -0800 (PST)
X-Google-Smtp-Source: AK7set96bt7gvSHvKjmhBDs2b3Z72rZLPfZYhNZB1VbavA7waxCuMzsdQ+eFFer/qZFTj9SUZxP9sdi+017tMaBMtnc=
X-Received: by 2002:a0d:eb0b:0:b0:506:5637:b000 with SMTP id
 u11-20020a0deb0b000000b005065637b000mr2939962ywe.461.1675178174889; Tue, 31
 Jan 2023 07:16:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJD_bPJ1VYTSQvogui4S9xWn9jQzQq8JRXOzXmus+qoRyrybOA@mail.gmail.com>
 <Y9Vg26wjGfkCicYv@kroah.com> <CAJD_bPLkkgbk+GO66Ec9RmiW6MfYrG32WP75oLzXsz2+rpREWg@mail.gmail.com>
 <CAJD_bPK=m0mX8_Qq=6iwD8sL8AkR99PEzBbE3RcSaJmxuJmW6g@mail.gmail.com>
 <02834fa9-4fb0-08fb-4b5f-e9646c1501d6@leemhuis.info> <288d7ff4-75aa-7ad1-c49c-579373cab3ed@intel.com>
 <CALFERdw=GwNYafR3q=5=k=H_jrzTZMyDBQLouFGV0JGu8i9sCg@mail.gmail.com> <04a9f939-8a98-9a46-e165-8e9fb8801a83@intel.com>
In-Reply-To: <04a9f939-8a98-9a46-e165-8e9fb8801a83@intel.com>
From: Jason Montleon <jmontleo@redhat.com>
Date: Tue, 31 Jan 2023 10:16:03 -0500
Message-ID: <CAJD_bP+Te5a=OfjN9YrjGOG2PzudQ87=5FEKj6YLFxfKyFe5bw@mail.gmail.com>
Subject: Re: Google Pixelbook EVE, no sound in kernel 6.1.x
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Sasa Ostrouska <casaxa@gmail.com>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, Greg KH <gregkh@linuxfoundation.org>, 
	lma@semihalf.com, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
	stable@vger.kernel.org, Takashi Iwai <tiwai@suse.de>, 
	=?UTF-8?B?YW1hZGV1c3ogU8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 31, 2023 at 7:37 AM Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
>
> On 2023-01-30 1:22 PM, Sasa Ostrouska wrote:
>
> > Dear Czarek, many thanks for the answer and taking care of it. If
> > needed something from my side please jest let me know
> > and I will try to do it.
>
>
> Hello Sasa,
>
> Could you provide us with the topology and firmware binary present on
> your machine?
>
> Audio topology is located at /lib/firmware and named:
>
> 9d71-GOOGLE-EVEMAX-0-tplg.bin
> -or-
> dfw_sst.bin
>
> Firmware on the other hand is found in /lib/firmware/intel/.
> 'dsp_fw_kbl.bin' will lie there, it shall be a symlink pointing to an
> actual AudioDSP firmware binary.
>
Maybe this is the problem.

I think most of us are pulling the topology and firmware from the
chromeos recovery images for lack of any other known source, and it
looks a little different than this. Those can be downloaded like so:
https://gist.github.com/jmontleon/8899cb83138f2653f520fbbcc5b830a0

After placing the topology file you'll see these errors and audio will
not work until they're also copied in place.
snd_soc_skl 0000:00:1f.3: Direct firmware load for
dsp_lib_dsm_core_spt_release.bin failed with error -2
snd_soc_skl 0000:00:1f.3: Direct firmware load for
intel/dsp_fw_C75061F3-F2B2-4DCC-8F9F-82ABB4131E66.bin failed with
error -2

Once those were in place, up to 6.0.18 audio worked.

Is there a better source for the topology file?

> The reasoning for these asks is fact that problem stopped reproducing on
> our end once we started playing with kernel versions (moved away from
> status quo with Fedora). Neither on Lukasz EVE nor on my SKL RVP.
> However, we might be using newer configuration files when compared to
> equivalent of yours.
>
> Recent v6.2-rc5 broonie/sound/for-next - no repro
> Our internal tree based on Mark's for-next - no repro
> 6.1.7 stable [1] - no repro
>
> Of course we will continue with our attempts. Will notify about the
> progress.
>
>
> [1]:
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=v6.1.7&id=21e996306a6afaae88295858de0ffb8955173a15
>
>
> Kind regards,
> Czarek
>


-- 
Jason Montleon        | email: jmontleo@redhat.com
Red Hat, Inc.         | gpg key: 0x069E3022
Cell: 508-496-0663    | irc: jmontleo / jmontleon

