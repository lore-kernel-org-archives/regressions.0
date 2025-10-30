Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EA6302163
	for <regressions@lists.linux.dev>; Thu, 30 Oct 2025 02:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761791313; cv=none; b=j2BzPjq4HBW0Ki7xUqWkd3Hs05pHT/Z6u08gF9dYPDv80nKPbmtvPkl1RdhGJubnia/464Q6XhHiqO/T84hbJLjUKo+fz7Q7MV9zRVyjF2J3tkzIpKLbRbtN7Yyu7SVSgZiF4O6s/lpS8wLq6IkZOcQ5GDG4LgoZAOzINl7zvjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761791313; c=relaxed/simple;
	bh=ueYr4fDOrACBm0KAvR6isY3b4Yz0LjNUirZu7x5KA9c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r42PIbU7ldRa0xsT81AIg70AgZXKEHnLCTX14uAAUdew3uJW8BM8LFhto8GZFGK8LQNrSqIEjdXbOxdPruXIqfHmote+mxqjK/Qmuyj3PhXpJvQTgjET+zlb4DFlQAx5mpGzOFqdMylRkT6eMpb7KB+MjZKiWsHRItY+sYYJ2eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LPGsfiVg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LPGsfiVg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761791304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eEN+zeuhvan/3gHVWq0QoHaYVhmGbEh/guxFqXcIed0=;
	b=LPGsfiVgldf3VkRiNZAS6Km/1pCoG9/U3McG1Gze+Fzq5LNxTak9Qp1rBe90SZ7zIrtjDf
	iC1WBxxpfUvon3evnqUfFV6JQ0FeTL57q6YAv65q+3r0IVtwSBrj22Sbm3mDLsopcXjDjN
	f2eXkxUO74q15r8K7jkiuotiooaycuc=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-D3T_Tn6sPs6A_OGybgxstg-1; Wed, 29 Oct 2025 22:28:14 -0400
X-MC-Unique: D3T_Tn6sPs6A_OGybgxstg-1
X-Mimecast-MFC-AGG-ID: D3T_Tn6sPs6A_OGybgxstg_1761791290
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32edda89a37so450444a91.1
        for <regressions@lists.linux.dev>; Wed, 29 Oct 2025 19:28:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761791290; x=1762396090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eEN+zeuhvan/3gHVWq0QoHaYVhmGbEh/guxFqXcIed0=;
        b=EiK68H40hpHZ6FF2RKM4y4Q7rNMAgJ2OuepoaFN4xEu+rFXlFWkAs4vPEgppihCghu
         hFPVDEgiVrjX9aTViQ4b049doidWgNQZ8gdKY+XYY9NJ8S/7LLOkpBMHkLoF9pX6WQrh
         8SgQL4GNRxllJ5wEI+7lmHQPXmOg1+YM3pM6ldQmpFINkBOJXK4pto8girmWMoGTdfFd
         NH0VNx0Fgm2Ur6lqZhePfP21nvW04apgEFJyMNSK8jE0Xf31BViRGCgYRv9dBZ2t5d2C
         99juYOFVujsYEXW2OntxXBR5Bba97aQv1WoiwRMTtvjTXqXl36CDABRSWLqFk+0evLOE
         oXGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWte9olKbuuZ9Cn4Lz3oJnibSVbygZIWRCQCuETVLktdLPleJVbwcfDK6DhqZxp4pTPenGF9e60UrDrFw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzW9UB7g1ONY9zAmyzi/kPAd29qiQI/JFFN2kqQztHaxwOuaEs6
	yqN7hiJ2yuzLJg+wugXPhlZyn1cfiSFXaCx5pv+xM/SJrpOZMpX0lajvllM1eES+gHYlsQh3z0N
	tQRSVYzU9pGO0NiyK03RLSS5RMSkZwZ9KsOZ6BigVTnt7TlNOLDQ3EZsQflGprKjYM3KzxbZ2tw
	vj5FH1iRpZXktBkXe0egpZj5QBhxp28b6lSthIQwk=
X-Gm-Gg: ASbGncuuzG57XHcpOVviypD/kyCQzRpSeJmuIUI+3T7itbJ8AEl98+7HiCfh7hRMzng
	z9RKVwf82h0MW9AZfUs22jdSKlYqL/cTYx5vaedGlZCKIfPpqpOYo/SdDrjOJql/hx0xm7fXamz
	3oFcaqIoBDFanYBp1v150z0lPzVF0AczPeKDCcUezAq23+K8tIFQXs
X-Received: by 2002:a17:90b:52c5:b0:33e:2d0f:4792 with SMTP id 98e67ed59e1d1-3403a291b3cmr6059394a91.28.1761791289751;
        Wed, 29 Oct 2025 19:28:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHEWi/hchP75vr8TIP5GW4NVbW1uVRS0LdgxFaSgFw7RPLbuq2PN5WoSwups/PCd+nOV9QSlX3uJ5UVD6ygrA=
X-Received: by 2002:a17:90b:52c5:b0:33e:2d0f:4792 with SMTP id
 98e67ed59e1d1-3403a291b3cmr6059377a91.28.1761791289293; Wed, 29 Oct 2025
 19:28:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <87y0ota32b.fsf@alyssa.is>
In-Reply-To: <87y0ota32b.fsf@alyssa.is>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 30 Oct 2025 10:27:55 +0800
X-Gm-Features: AWmQ_bmHhVnu561Asm5YRG2jN4tA7sSFzSe2trT2iThrq4EmrmxrrfR7rVVshjM
Message-ID: <CACGkMEuTnLX7EPuOLb2UhrZT2oH2AcXPQrvq-uw2ZydYV_FAgQ@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] virtio_net CSUM broken with Cloud Hypervisor
To: Alyssa Ross <hi@alyssa.is>
Cc: Paolo Abeni <pabeni@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org, 
	virtualization@lists.linux.dev, regressions@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WtlDYDu4n82m8M1iChiNBZ2tpBZYzttTUjVQ0GWy33Q_1761791290
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2025 at 4:03=E2=80=AFAM Alyssa Ross <hi@alyssa.is> wrote:
>
> Since 56a06bd40fab ("virtio_net: enable gso over UDP tunnel support."),
> networking in Cloud Hypervisor is no longer working for me.
>
> I've narrowed down the problem to here:
>
> > @@ -2555,14 +2567,21 @@ static void virtnet_receive_done(struct virtnet=
_info *vi, struct receive_queue *
> >       if (dev->features & NETIF_F_RXHASH && vi->has_rss_hash_report)
> >               virtio_skb_set_hash(&hdr->hash_v1_hdr, skb);
> >
> > -     if (flags & VIRTIO_NET_HDR_F_DATA_VALID)
> > -             skb->ip_summed =3D CHECKSUM_UNNECESSARY;
> > +     hdr->hdr.flags =3D flags;
>
> It looks like this was added because virtio_net_handle_csum_offload()
> looks at the flags from the hdr it's given, rather than having it passed
> separately, but it appears something later on relies on the previous
> value of hdr->hdr.flags.
>
> From my tracing, hdr->hdr.flags is set to either 0 or
> VIRTIO_NET_HDR_F_NEEDS_CSUM before this assignment, and flags is always
> 0, so in some cases VIRTIO_NET_HDR_F_NEEDS_CSUM now ends up being unset.

Are you using XDP, if not there should be no change.

>
> > +     if (virtio_net_handle_csum_offload(skb, &hdr->hdr, vi->rx_tnl_csu=
m)) {
> > +             net_warn_ratelimited("%s: bad csum: flags: %x, gso_type: =
%x rx_tnl_csum %d\n",
> > +                                  dev->name, hdr->hdr.flags,
> > +                                  hdr->hdr.gso_type, vi->rx_tnl_csum);
> > +             goto frame_err;
> > +     }
>
> If I change it to save the previous value of hdr->hdr.flags, and restore
> it again here, everything works again.
>
> Disabling offload_csum in Cloud Hypervisor is a usable workaround,
> because then hdr->hdr.flags is always 0 to begin with anyway.
>
> #regzbot introduced: 56a06bd40fab

Is mergeable rx buffer enabled, if not, I wonder if this can be fixed by:

https://marc.info/?l=3Dlinux-netdev&m=3D176170721926346&w=3D2

Thanks

