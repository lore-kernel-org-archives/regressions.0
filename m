Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4AEC131
	for <regressions@lists.linux.dev>; Wed, 23 Aug 2023 14:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692799356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ERUI+NK+jUnEExmqCqtfIrVKBUpED9COp25lOAtb1+k=;
	b=QA5Hsc4TGkLpTN2MfWDvAoDCzkRTJsJrW3oGa/E6i7IeuaMzuTtsPTVZ9BY62REvVV82k9
	wOk1zBP7V0bL8kN03H8Hx7jqClR74C5E6E460RtZpo6ThKTohdhtDK4vZnX9TlbWTQukc/
	J3BOdZQ87kCLNo36SHty0wYM21iGJKE=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-97-EtPRHYCgNhSjTUmv53ac8Q-1; Wed, 23 Aug 2023 10:02:35 -0400
X-MC-Unique: EtPRHYCgNhSjTUmv53ac8Q-1
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-26f3bf964feso4177610a91.1
        for <regressions@lists.linux.dev>; Wed, 23 Aug 2023 07:02:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692799354; x=1693404154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ERUI+NK+jUnEExmqCqtfIrVKBUpED9COp25lOAtb1+k=;
        b=DU4bYIWte+Mu6+hYZSGfuhjTHO9DnMb0Pbag//Q2G+BCorhdT8nG2aOD61rAXjxKho
         dV+c/SxVw7maJJFD3SaXIhPFEn3smyG747oix6H8HpjyRVPkBLyTdVNFNJ05eo4SjFg+
         J9Z9Wlvibv+oSVVpgp/SHBOELMuk7SnT5KVNZPwq6xqM1My0HWHQpxxDUCxEmvw3pYVj
         fcnXD22LvbWrMQRUTekFj5Y3gst5o7F9OpAYylGXBVe+4KkEPMNk/2SCF58lF8b8DNqO
         MjvXh2LkXPrUZgcUDEY7mnV2zKQb5+QT9WMMSucWIvyeJVpNE1p0cA5LsX/4h5lzKPht
         vCkw==
X-Gm-Message-State: AOJu0YzhdocGjLc7EJz3IWzPPfvsuSlFmXsTtDa69Mn+Y32Oii5E3QFx
	I/5mwKXkz0Rd7JqzBAIhqJx9L1lTLgSaYxEI6N9WbTrPptSzlkPMbB00c04r8p01ao+NFlSzWBf
	50Pn28WBIZcs0pgg/R8pLm5xfu5SDr8tlEcc38g==
X-Received: by 2002:a17:90a:7348:b0:269:25a8:66c with SMTP id j8-20020a17090a734800b0026925a8066cmr9103881pjs.45.1692799354045;
        Wed, 23 Aug 2023 07:02:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGW15JE4LCJ/KkWX1lMJBTT7PNOrDO2QO/djYtszrlFSukD3QntsPQ15tf/oS3atq2ke0SzXuOjqxDb14QYQdk=
X-Received: by 2002:a17:90a:7348:b0:269:25a8:66c with SMTP id
 j8-20020a17090a734800b0026925a8066cmr9103833pjs.45.1692799353440; Wed, 23 Aug
 2023 07:02:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+cBOTeWrsTyANjLZQ=bGoBQ_yOkkV1juyRvJq-C8GOrbW6t9Q@mail.gmail.com>
 <20230821131223.GJ3465@black.fi.intel.com> <CA+cBOTc-7U_sumg6g-uBs9w3m8xipuOV1VY=4nmBcyuppgi8_g@mail.gmail.com>
 <20230823050714.GP3465@black.fi.intel.com> <CA+cBOTdS5djXL=93VThP9K67pjYKHtjceqSczKf8NQonhpgo5Q@mail.gmail.com>
 <20230823074447.GR3465@black.fi.intel.com> <20230823075649.GS3465@black.fi.intel.com>
 <CA+cBOTco17b_8ZMhU8gXy8z2mtZXvVxrEUdKaAuZMhyFYC3yeQ@mail.gmail.com> <20230823090525.GT3465@black.fi.intel.com>
In-Reply-To: <20230823090525.GT3465@black.fi.intel.com>
From: Kamil Paral <kparal@redhat.com>
Date: Wed, 23 Aug 2023 16:02:06 +0200
Message-ID: <CA+cBOTeOSBkw_-AM6desmdVQjTXUZbKppK_PDiOM3sXQW5QKiA@mail.gmail.com>
Subject: Re: [REGRESSION] resume with a Thunderbolt dock broke with commit
 e8b908146d44 "PCI/PM: Increase wait time after resume"
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-pci@vger.kernel.org, regressions@lists.linux.dev, 
	bhelgaas@google.com, chris.chiu@canonical.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 23, 2023 at 11:05=E2=80=AFAM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> OK. Did you change any BIOS settings from the defaults that might have
> affect on this? Sometimes these are exposed to through the BIOS menu and
> the user can change those (Lenovo typically does not, expose them
> though).

These BIOS pages seem they could be relevant:
https://imgur.com/a/vEltxpj

And heureka, "Thunderbolt BIOS Assist Mode" affects this! It was
disabled (not sure if that's the default or I changed it before).
After I enable it, the resume 60+ second delay is gone, it resumes in
standard ~5 seconds. The dock devices (mouse, LAN) still take a few
extra seconds to activate. The dmesg for a resume with TB assist mode
is here:
https://bugzilla-attachments.redhat.com/attachment.cgi?id=3D1984785

Unfortunately, it seems to have its own quirks. There seems to be
something like ~20% chance that the dock devices are no longer
available after resume. I see the dock as connected in boltctl, but I
no longer see the devices in lsusb. Reconnecting the dock doesn't
help, more suspend&resume cycles don't help, only system reboot helps.
I captured this situation in this dmesg (there are multiple resume
events, the devices disappear after the last one):
https://bugzilla-attachments.redhat.com/attachment.cgi?id=3D1984786

This might be the same problem that I described regarding
pcie_aspm=3Doff to Bjorn, but I'd need to check. Either way, this wasn't
happening when the TB assist mode was disabled.

> Can you also attach output of acpidump to and dmesg with
> "thunderbolt.dyndbg=3D+p" in the command line?

acpidump:
https://bugzilla-attachments.redhat.com/attachment.cgi?id=3D1984802

dmesg with "thunderbolt.dyndbg=3D+p" and one suspend&resume cycle:
https://bugzilla-attachments.redhat.com/attachment.cgi?id=3D1984803

I'm currently running kernel 6.4.8 packaged in Fedora 38 for these
experiments, I hope that's OK. If needed, I can switch to the latest
kernel.

