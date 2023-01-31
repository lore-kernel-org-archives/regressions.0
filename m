Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62EC8C04
	for <regressions@lists.linux.dev>; Tue, 31 Jan 2023 14:59:00 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id r17-20020a056830449100b0068bb088317aso3690382otv.12
        for <regressions@lists.linux.dev>; Tue, 31 Jan 2023 06:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b4cvP78TQ8pZ1o4FMvO56uD5G3a5Ju4sFzbJ19YYjIM=;
        b=IFaAilxDAKjtiRINHrrwg7JLOApL6mQVykAiI0uh+G7RjgzYbmzMnU+wU4mJKX/k+G
         +zDoIfF8qGE6/JdgEuyFB8DtLE0RJRPGmHxwINsbqu0X9yk0HMIWdy3oQy9bayS6se73
         tZFBx5KbKib7QP9MRwEjneruPD3/10jJdgXyINbQrqaa+po+fGG1CqvPFN4JK267CIps
         Sg5A/Qt9zOjngIS1aQ8MTrukY4hZDLOtI1KEBopIyyKjaAmJoB33bKkblUMgGa0u1h84
         8SNWVYfRpqLXfRiYR8Fe8zB8Y7xKqFzqf9r7TCsIpzXJvKJcFNYj6AMiiqZBf4bRwh0Z
         GMRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b4cvP78TQ8pZ1o4FMvO56uD5G3a5Ju4sFzbJ19YYjIM=;
        b=Nfrk4gQPAt0eGWd2kp+23UNRCbGJtv4CD9JwcLuKY9y3jEI+lP+t2kFh+/drnpRPgu
         GcWGlxOkVrMzfdikUEdPXAhgj+QkIO4lMgAp/VNT3/tD/oeUY2rMmIY1mFXOPoO5npSG
         /+1f5XIFomEhJOITkV2FMefyKw7Hobtc3L4d7+UVVhL3Pwf4cIaaouRKz7pSnBWC860x
         Q96hUrOxZbqDN1QQYgCw68Ca3I81qS+KQ6Ohm0iqictOeh6/ADu+t73vFAp08nFbMzJ4
         W0WVTEasiT3NCANZ45JOyUzBkCzm2WXtUs1bS6bGycC7XEbZ60/fC5N9AOO5Y3Um7tJu
         i6zg==
X-Gm-Message-State: AO0yUKU3Ywn/w3Z07f60o6zuN0k8P/xwmk7bI0UWiNJK4RlF3lRJz+w6
	GsWEt7jSm3H+9gg27Ph17MWHyOztQQDAMX6qdok=
X-Google-Smtp-Source: AK7set/oz48a+BOBUWl6H3E2jgmx1ZFu/DouYKRJLpmFCA0JydLb6N9rLhwAmoEOnWAPtQz8na6TGcX1s8Ysb8fO060=
X-Received: by 2002:a05:6830:4aa:b0:68b:d2f3:a28 with SMTP id
 l10-20020a05683004aa00b0068bd2f30a28mr358850otd.113.1675177139683; Tue, 31
 Jan 2023 06:58:59 -0800 (PST)
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
From: Sasa Ostrouska <casaxa@gmail.com>
Date: Tue, 31 Jan 2023 15:58:48 +0100
Message-ID: <CALFERdwVzz5a7k7XjBkNyGKKd8+4Fez62Lq__6jOarqnBJQjJQ@mail.gmail.com>
Subject: Re: Google Pixelbook EVE, no sound in kernel 6.1.x
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, Jason Montleon <jmontleo@redhat.com>, 
	Greg KH <gregkh@linuxfoundation.org>, lma@semihalf.com, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, stable@vger.kernel.org, 
	Takashi Iwai <tiwai@suse.de>, 
	=?UTF-8?B?YW1hZGV1c3ogU8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 31, 2023 at 1:37 PM Cezary Rojewski
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
Hi Czarek,
>
> Could you provide us with the topology and firmware binary present on
> your machine?
>
Sure, see below.

> Audio topology is located at /lib/firmware and named:
>
> 9d71-GOOGLE-EVEMAX-0-tplg.bin
-rw-r--r--. 1 root root   37864 21 nov 20.18 9d71-GOOGLE-EVEMAX-0-tplg.bin


> -or-
> dfw_sst.bin
>
> Firmware on the other hand is found in /lib/firmware/intel/.
> 'dsp_fw_kbl.bin' will lie there, it shall be a symlink pointing to an
> actual AudioDSP firmware binary.

lrwxrwxrwx. 1 root root     23 23 gen 10.28 dsp_fw_kbl.bin.xz ->
dsp_fw_kbl_v3402.bin.xz

>
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

Ok, waiting for your good news, on the other hand if you need anything
else feel free to ask.
>
>
> [1]:
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=v6.1.7&id=21e996306a6afaae88295858de0ffb8955173a15
>
>
> Kind regards,
> Czarek

Rgds
Sasa
