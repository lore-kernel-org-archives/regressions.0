Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9904285047
	for <regressions@lists.linux.dev>; Sat, 16 Aug 2025 11:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755342994; cv=none; b=mspa6v9Bb5+IBGlgyay9gcxKHW/B4OBkw/4G8kiQxVbKfbM1UOhU3gqP22LI71YHsgKZ+hAB8NxgF1oTj1oIed/dxKK5E/QKM4Y93Vt/lrnGOAASqcNZqKuHz7vuZ7cdG/dHra8cs1NmLV6vd7Rgxj9e+j6qQ+tM9Vlbz2IaPys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755342994; c=relaxed/simple;
	bh=p+OQJdHRBzlxDexxQc8bsWt3RekR3nxtrLX9rgGs9d4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=TMLEvT8mj0oTyW5K/ipNmdp8NH4a9TRkpNApwgI9+85PAV4MhUS0ZlXi/iQM6yjXnRAHZ68qKn/E0WIYcVOAv2cq6Ot56Kut8Lzhl0ikHVmRepBycC3QPFtKSZfy4ejEkHpt6IejTAJ6kSyLi1jjYaIb7iMEypKSpbwY1QszfXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AVs1zYbe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AVs1zYbe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755342991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9+qL3UxaFfrtgWhKmgO7weS5eswTNMs7xBKwQ0a2qNg=;
	b=AVs1zYbeBjdGnIYa8G87Z+k7ZEeUp6xW4pp3YvZ7wkdztiN9Iv5rRFldR1vTwxcpFRP0la
	2AH1DAldDAP0DpAtp5aU8U25+cj69yvPzIQTIfn8f+uT+PCLQd+F5C27ZZ3762mHWvtHNS
	o4y8lmgVpW5QLm7wLWzssu/5T+54tI4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-ijRj9CY2OSuerX6zSpm68Q-1; Sat, 16 Aug 2025 07:16:27 -0400
X-MC-Unique: ijRj9CY2OSuerX6zSpm68Q-1
X-Mimecast-MFC-AGG-ID: ijRj9CY2OSuerX6zSpm68Q_1755342986
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3b916fd2cf3so1391786f8f.0
        for <regressions@lists.linux.dev>; Sat, 16 Aug 2025 04:16:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755342986; x=1755947786;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9+qL3UxaFfrtgWhKmgO7weS5eswTNMs7xBKwQ0a2qNg=;
        b=R3KGuZooB2P6ED/TYX/SQSvPBB+Ut+Cn8Bb/WaXRNl0QCbizID1iNhlAs0R7CwxEqY
         a0HKcvQHEa7f9v2toIHA5+8U/tiG54MxlXQqth8HQPgR8gZIpmygfwwglhK095vtKHHJ
         eN9aGomznALSfwRvpjuFvpXUQHFWVP5WJd6RNriclXeOFgptJw2oJnpeYwcCsu+WZAmp
         etJ2h1J6wxwimHfhWVr6Smq3f4OwVSduIytDk+XccNaipd0MNTeuill+M6Zc4eYPbXSe
         XE4MTFvOr2lVNb0M/Vd7fiwM23CSqOdJezqZyP4E0KO1Vxvu3vajPmW33g7RTijIY3UW
         TTzA==
X-Forwarded-Encrypted: i=1; AJvYcCXXZolz0AjA0Re3P8/WRhx2lfmJrR3WUpUGmVNwTpmdAXiSs5IyGcGDTjKwYcDDD/ewWBmn8L4oeHZTZw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9I+k3YFZZHJ/OuiVJAKNW5DH3cLZ5W2SiAkR9u2WayczkcwIg
	IbC0NO4pJLf3RTDI5oiDSR5t+Z492MGZUqKaHTUWghxoX1DiI3k76uCgUrlB0L/jqdO1yKyr+fI
	SKo3YPV+hH8wvPCPU/DyYBzu0cdgtYlyJit30b6gjCUV16rAw7709LcMFYtLm+sRa
X-Gm-Gg: ASbGncuJRAx1/ZHy4gtrLJh0+PmcFT/TianSfcYxAReqEENPqc1ZFd24cEzNmsWDTTF
	gkVdpUNYxfOV4dyKGSgKY5PPQUfilsvkfzvYnTYMF5rihR4tbSEZdi9Je1mhEOjpz8L+rNOdB4b
	mEYz4rORqqKquUlrXO7EWE5EKTyCCfxauQ731h3BiI68ZxT7/qU0M3yn3UEeqNzm0XuNf4QGSw0
	eSFrOUj8sDaoSoqLHDSl9zDjJhTgcSspyEk7EwpEvrIlBp02gcD+OCy2bGsU6uhyArP3+YZEstZ
	oM6P/PVXI9LI3itBF27Bjl+VwtRF1nzbyp8=
X-Received: by 2002:a05:6000:22c6:b0:3b8:d740:a16a with SMTP id ffacd0b85a97d-3ba508ec53emr8158707f8f.16.1755342986429;
        Sat, 16 Aug 2025 04:16:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCB/tq6+rH1afwsy5HF5LOvKBlZteXTvS85IvwsaJcRQSuivds13I3biPvIiVcaxEDU6JMqQ==
X-Received: by 2002:a05:6000:22c6:b0:3b8:d740:a16a with SMTP id ffacd0b85a97d-3ba508ec53emr8158691f8f.16.1755342986010;
        Sat, 16 Aug 2025 04:16:26 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73cf:b700:6c5c:d9e7:553f:9f71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb64e27843sm5427333f8f.19.2025.08.16.04.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 04:16:25 -0700 (PDT)
Date: Sat, 16 Aug 2025 07:16:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alyssa Ross <hi@alyssa.is>
Cc: SamiUddinsami.md.ko@gmail.com, jasowang@redhat.com,
	xuanzhuo@linux.alibaba.com, eperezma@redhat.com,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
	Sami Uddin <sami.md.ko@gmail.com>, regressions@lists.linux.dev
Subject: Re: [REGRESSION] virtio: reject shm region if length is zero
Message-ID: <20250816071600-mutt-send-email-mst@kernel.org>
References: <20250511222153.2332-1-sami.md.ko@gmail.com>
 <kgasjsq2s4pshravsinycfihdfjhdts5iz2fox42aejs4xqhce@frurksambnk3>
 <87y0rkie9l.fsf@alyssa.is>
 <20250816063522-mutt-send-email-mst@kernel.org>
 <878qjj8r2m.fsf@alyssa.is>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <878qjj8r2m.fsf@alyssa.is>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YyiI8ijbsETheRkWdZTHfSMqrL0UmSkHEz89L8ciGT0_1755342986
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sat, Aug 16, 2025 at 01:05:21PM +0200, Alyssa Ross wrote:
> "Michael S. Tsirkin" <mst@redhat.com> writes:
> 
> > On Fri, Aug 15, 2025 at 09:19:34PM +0200, Alyssa Ross wrote:
> >> Alyssa Ross <hi@alyssa.is> writes:
> >> 
> >> > On Mon, May 12, 2025 at 07:51:53AM +0930, SamiUddinsami.md.ko@gmail.com wrote:
> >> >> From: Sami Uddin <sami.md.ko@gmail.com>
> >> >>
> >> >> Prevent usage of shared memory regions where the length is zero,
> >> >> as such configurations are not valid and may lead to unexpected behavior.
> >> >>
> >> >> Signed-off-by: Sami Uddin <sami.md.ko@gmail.com>
> >> >> ---
> >> >> v3:
> >> >> - Use idiomatic 'if (!region->len)' as suggested by reviewer
> >> >> v2:
> >> >> - Fixed coding style issue: added space after 'if' statement
> >> >>
> >> >>  include/linux/virtio_config.h | 2 ++
> >> >>  1 file changed, 2 insertions(+)
> >> >
> >> > Hi, I'm sorry to be the bearer of bad news, but since this patch my VM
> >> > no longer works.  The system is running wayland-proxy-virtwl[1] inside
> >> > a crosvm[2] VM, using crosvm's virtio-gpu device to do cross-domain
> >> > Wayland forwarding.
> >> >
> >> > Since this change, wayland-proxy-virtwl crashes with the following log
> >> > message:
> >> >
> >> > 	wl-proxy [WARNING]: Error handling client: Unix.Unix_error(Unix.EINVAL, "DRM_IOCTL_VIRTGPU_RESOURCE_CREATE_BLOB", "")
> >> >
> >> > I'm pretty confused by what this change was supposed to do in the first
> >> > place…  Looking at how virtio_get_shm_region() is used in
> >> > virtio_gpu_init(), it's called with a pointer to zeroed memory, and then
> >> > the get_shm_region() implementation is supposed to write to the region,
> >> > without ever reading from it as far as I can tell.  Why is the initial
> >> > value of an out parameter being checked at all?  How does this prevent
> >> > using zero-length shared memory regions?
> >> >
> >> > [1]: https://crosvm.dev/
> >> > [2]: https://github.com/talex5/wayland-proxy-virtwl
> >> >
> >> > #regzbot introduced: 206cc44588f72b49ad4d7e21a7472ab2a72a83df
> >> 
> >> Okay, just found that it's already been reverted:
> >> https://lore.kernel.org/all/20250808072533-mutt-send-email-mst@kernel.org/
> >> 
> >> Still, I'm confused how this was supposed to fix anything…
> >> 
> >> #regzbot fix: Revert "virtio: reject shm region if length is zero"
> >
> >
> >
> > Are you asking why was the patch applied in the 1st place?
> > It seemed like an invalid behaviour to me, and I thought it's
> > not too late to block it so we don't need to support it
> > down the road.
> 
> So you just weren't aware during the review that it's an output
> parameter rather than an input?  Should the parameter maybe be renamed
> or something to make that more obvious?

Sounds like a good idea.

-- 
MST

