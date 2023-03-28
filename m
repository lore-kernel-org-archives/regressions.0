Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85612772D
	for <regressions@lists.linux.dev>; Tue, 28 Mar 2023 22:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680042207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YZOEXo//NG6ZuxMwWYZ3Q5XdOI468xHeInsZ4IotWAU=;
	b=VpKnSvVy3Iu44o5B3NHoKWGXcHo/AZL8OCdote6puVY5Lj9BVdVKaZXPEsVBcvLNxojF91
	OghwW83iQNCEulM6uALEYxKJZpoKSPnEN90mMRtGmT/DPKj4DKI2N8sT2S4IsqA7PbEOyV
	39r4aDBQGGawVXhytLCP1275UvklYCI=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-368-w5VgryvbNKeybIVfODDFbw-1; Tue, 28 Mar 2023 18:23:26 -0400
X-MC-Unique: w5VgryvbNKeybIVfODDFbw-1
Received: by mail-qv1-f69.google.com with SMTP id pr2-20020a056214140200b005b3ed9328a3so5788734qvb.10
        for <regressions@lists.linux.dev>; Tue, 28 Mar 2023 15:23:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680042205;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O/880kkvDFtCR5sIo7DiowXLZImkJfXYxCTOdE4arHY=;
        b=KjJPYnxWDXFiSJXkH4YiN8KIB35crZJXHM+TndJP2WBe0dJuEmddfwz+wH0vVATKQ2
         f+gMdxlQx8grUmN734iJ3K1JKHz+oXxRPZxbRnIKCcpXKx0A7PbMSRpe2CLfJQfW6C2i
         oi5+4sz5HDMkg0S38mM3xPWyvzqbCKPqjzZ6rFJoTlPj6lrbyqQUjLdqI4GWqvRL9Opn
         bsTmaGc45RaTuxpb6CJ7McS7efZlyc/diWpg5lwX7mNhvBNgKPA+FnF36wO0tjSjHFMn
         iblqXAburefZgU9Af46ZTRabpd5YTE0+CT8yDCFjoBwkMvhNBJqro4VeE3l64G9f8QYm
         vmsQ==
X-Gm-Message-State: AAQBX9e9ASYOH084Ik23HrWMOBGJpewfWkDJh+LhWZe8DkwuW0lLmJGv
	Y7UEKqtPADHXwAvSrqZ+7oOg8WQUSVPuT7NnVuIPWhzxcde2ssIN6A4QTvXhVN+T50Mit8uIDFb
	LCgSBn4ltpoZIEUzAgpMAUtQ=
X-Received: by 2002:a05:6214:20e8:b0:571:13c:6806 with SMTP id 8-20020a05621420e800b00571013c6806mr27337650qvk.33.1680042205717;
        Tue, 28 Mar 2023 15:23:25 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZHs3HSZwuEOKXFrGu7Y8M8LAvPxj+euHxcA9SzX+HVHy5mGA1OUIs92Bd1flUbQgB9m2rGUg==
X-Received: by 2002:a05:6214:20e8:b0:571:13c:6806 with SMTP id 8-20020a05621420e800b00571013c6806mr27337629qvk.33.1680042205469;
        Tue, 28 Mar 2023 15:23:25 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c57:b700::feb? ([2600:4040:5c57:b700::feb])
        by smtp.gmail.com with ESMTPSA id ec13-20020ad44e6d000000b005dd8b9345ddsm4123898qvb.117.2023.03.28.15.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 15:23:25 -0700 (PDT)
Message-ID: <3b14406294755cde2b2be6ba54dc09105c071775.camel@redhat.com>
Subject: Re: [PATCH 6.2 regression fix] drm/nouveau/kms: Fix backlight
 registration
From: Lyude Paul <lyude@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, 
	Karol Herbst <kherbst@redhat.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	regressions@lists.linux.dev, Mark Pearson <mpearson@lenovo.com>
Date: Tue, 28 Mar 2023 18:23:24 -0400
In-Reply-To: <20230326205433.36485-1-hdegoede@redhat.com>
References: <20230326205433.36485-1-hdegoede@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Lyude Paul <lyude@redhat.com>

(Also note to Mark: this is my way of letting you know someone fixed the
regression with backlight controls upstream, looking into the weird bright
screen after resume issue)

On Sun, 2023-03-26 at 22:54 +0200, Hans de Goede wrote:
> The nouveau code used to call drm_fb_helper_initial_config() from
> nouveau_fbcon_init() before calling drm_dev_register(). This would
> probe all connectors so that drm_connector->status could be used during
> backlight registration which runs from nouveau_connector_late_register().
>=20
> After commit 4a16dd9d18a0 ("drm/nouveau/kms: switch to drm fbdev helpers"=
)
> the fbdev emulation code, which now is a drm-client, can only run after
> drm_dev_register(). So during backlight registration the connectors are
> not probed yet and the drm_connector->status =3D=3D connected check in
> nv50_backlight_init() would now always fail.
>=20
> Replace the drm_connector->status =3D=3D connected check with
> a drm_helper_probe_detect() =3D=3D connected check to fix nv_backlight
> no longer getting registered because of this.
>=20
> Fixes: 4a16dd9d18a0 ("drm/nouveau/kms: switch to drm fbdev helpers")
> Link: https://gitlab.freedesktop.org/drm/nouveau/-/issues/202
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_backlight.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/dr=
m/nouveau/nouveau_backlight.c
> index 40409a29f5b6..91b5ecc57538 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> @@ -33,6 +33,7 @@
>  #include <linux/apple-gmux.h>
>  #include <linux/backlight.h>
>  #include <linux/idr.h>
> +#include <drm/drm_probe_helper.h>
> =20
>  #include "nouveau_drv.h"
>  #include "nouveau_reg.h"
> @@ -299,8 +300,12 @@ nv50_backlight_init(struct nouveau_backlight *bl,
>  =09struct nouveau_drm *drm =3D nouveau_drm(nv_encoder->base.base.dev);
>  =09struct nvif_object *device =3D &drm->client.device.object;
> =20
> +=09/*
> +=09 * Note when this runs the connectors have not been probed yet,
> +=09 * so nv_conn->base.status is not set yet.
> +=09 */
>  =09if (!nvif_rd32(device, NV50_PDISP_SOR_PWM_CTL(ffs(nv_encoder->dcb->or=
) - 1)) ||
> -=09    nv_conn->base.status !=3D connector_status_connected)
> +=09    drm_helper_probe_detect(&nv_conn->base, NULL, false) !=3D connect=
or_status_connected)
>  =09=09return -ENODEV;
> =20
>  =09if (nv_conn->type =3D=3D DCB_CONNECTOR_eDP) {

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

